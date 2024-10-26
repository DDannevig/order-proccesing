# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def create
    deposit = Deposit.find(params.require(:deposit_id)) if validate_products_params

    order_products_attributes = params[:products].map do |product|
      { product: Product.find_by!(identifier: product[:identifier]), quantity: product[:quantity] }
    end
    order = Order.create!(deposit: deposit, order_products_attributes: order_products_attributes)

    render json: order
  end

  private

  def validate_products_params
    params.require(:products).each do |product_params|
      product_params.require(%i[identifier quantity])
    end
  end
end
