class ProcessOrderWorker
  def self.perform(identifier)
    order = Order.find_by!(identifier: identifier)

    ActiveRecord::Base.transaction do
      order.order_products.each do |order_product|
        stock = order_product.product.stocks.find_by(deposit: order.deposit)
        stock.update!(quantity: stock.quantity - order_product.quantity)
      end

      order.update!(status: :prepared, order_prepared_at: DateTime.now)
    end

    order
  end
end
