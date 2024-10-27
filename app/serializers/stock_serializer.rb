class StockSerializer < ActiveModel::Serializer
  attributes :name, :quantity

  def name
    object.product.name
  end
end
