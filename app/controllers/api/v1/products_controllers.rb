class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  def index
    @products = Product.all

    render json: {
      status: 200,
      products: @products
    }
  end

  def show
    render json: {
      status: 200, product: @product
    }
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: {
        status: 200,
        product: @product
      }
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: {
        status: 200,
        product: @product
      }
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!
    render json: {
      status: 200,
      message: "product destoyed!"
    }
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end
end
