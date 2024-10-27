class OrderCreateSerializer < ActiveModel::Serializer
  attributes :identifier, :deposit, :products

  def deposit
    object.deposit.name
  end

  def products
    object.order_products.map do |order_product|
      { name: order_product.product.name }
    end
  end
end
