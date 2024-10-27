class ProductsController < ApplicationController
  def show
    render json: Product.find_by(identifier: params[:identifier]), status: :ok
  end

  def index
    render json: Product.all
  end

  def create
    render json: Product.create!(create_product_params)
  end

  def update
    product = Product.find_by!(identifier: params[:identifier])
    product.update!(name: params.require(:name))
    render json: product
  end

  def destroy
    Product.find_by!(identifier: params[:identifier]).destroy
    render :ok
  end

  private

  def create_product_params
    params.require(%i[name identifier])
    params.permit(%i[name identifier])
  end
end
