class OrdersController < ApplicationController
  def index
    render json: detailed_orders_information
  end

  def create
    deposit = Deposit.find(params.require(:deposit_id)) if validate_products_params

    order = Order.create!(deposit: deposit, order_products_attributes: order_products_attributes)

    render json: order, serializer: OrderCreateSerializer
  end

  def update
    render json: ProcessOrderWorker.perform(params[:id])
  end

  private

  def validate_products_params
    params.require(:products).each do |product_params|
      product_params.require(%i[identifier quantity])
    end
  end

  def order_products_attributes
    params[:products].map do |product|
      { product: Product.find_by!(identifier: product[:identifier]), quantity: product[:quantity] }
    end
  end

  def detailed_orders_information
    query = "SELECT o.identifier, d.name AS deposit, o.status, o.order_prepared_at,
    (json_agg(json_build_object('quantity', op.quantity, 'name', p.name, 'stock_quantity',
    (SELECT s.quantity FROM stocks s
    WHERE (s.deposit_id = d.id AND s.product_id = p.id))))) as products FROM orders o
    JOIN deposits d ON o.deposit_id = d.id JOIN order_products op ON op.order_id = o.id
    JOIN products p ON p.id = op.product_id
    GROUP BY o.identifier, deposit, o.status, o.order_prepared_at ORDER BY deposit, o.identifier"

    ActiveRecord::Base.connection.execute(query).to_a.map do |order|
      order.merge(products: JSON.parse(order['products']))
    end
  end
end
