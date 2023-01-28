class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  def index
    @orders = Order.all

    render json: {
      status: 200,
      orders: @orders
    }
  end

  def show
    render json: {
      stauts: 200,
      order: @order
    }
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      render json: {
        status: 200,
        order: @order
      }
    else
      render json: {
        message: @order.errors, status: :unprocessable_entity
      }
    end
  end

  def update
    if @order.update(order_params)
      render json: {
        status: 200,
        order: @order
      }
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy!
    render json: {
      status: 200,
      message: "order destoyed!"
     }
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:product_id, :pharmacy_id, :laboratory_id, :total_cost)
    end
end
