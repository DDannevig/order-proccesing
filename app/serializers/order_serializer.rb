class OrderSerializer < ActiveModel::Serializer
  attributes :identifier, :deposit, :status, :products

  def deposit
    object.deposit.name
  end

  def products
    object.order_products.map do |order_product|
      { name: order_product.product.name,
        ordered_quantity: order_product.quantity,
        stock_quantity: order_product.product.stocks.find_by(deposit: object.deposit).quantity }
    end
  end
end
