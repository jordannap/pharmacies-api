class Api::V1::PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: %i[ show update destroy ]

  def index
    if params.present?
      @pharmacies = Pharmacy.where(city: params[:city].downcase)
    else
      @pharmacies = Pharmacy.all
    end
    render json: {
      status: 200,
      pharmacies: @pharmacies
    }
  end

  def show
    render json: {
      status: 200,
      pharmacy: @pharmacy
    }
  end

  def create
    @pharmacy = Pharmacy.new(name: pharmacy_params[:name], city: pharmacy_params[:city].downcase )

    if @pharmacy.save!
      render json: {
        status: 200,
        pharmacy: @pharmacy
      }
    else
      render json: @pharmacy.errors, status: :unprocessable_entity
    end
  end

  def update
    if @pharmacy.update(pharmacy_params)
      render json: {
        status: 200,
        pharmacy: @pharmacy
      }
    else
      render json: @pharmacy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @pharmacy.destroy!
    render json: {
      status: 200,
      message: "pharmacy destoyed!"
      }
  end

  def create_order
    begin
      pharmacy = Pharmacy.find(params[:id])
      laboratory = Laboratory.find_by(id: params[:laboratory_id])
      if pharmacy.present? && laboratory.present?
        order = Order.create!(pharmacy_id: pharmacy.id, laboratory_id: laboratory.id)
        productListParams = params[:product_lists]
        if productListParams.length > 0
          response = OrderManageService.new(pharmacy, laboratory, order, productListParams).manage_order()
          if response[:status] == 200
          render json: {
            status: 200,
            message: "Order Placed!"
          }
          end
        else
          render json: {
            status: 500,
            message: "No Product Provided!"
          }
        end
      else
        render json: {
          status: 404,
          message: "Either Pharmacy or Laboratory is not found!"
        }
      end
    rescue => e
      render json: {
        status: 500,
        message: e.message
      }
    end
  end

  def sale
    begin
      pharmacy = Pharmacy.find(params[:id])
      if pharmacy.present?

        productListParams = params[:product_lists]
        sale = Sale.create!(pharmacy_id: pharmacy.id )
        response = SaleManageService.new(pharmacy, sale, productListParams).create_sale()
        if response[:status] = 200
          render json: {
            status: 200,
            message: "Sale Created!"
          }
        end
      else
        render json: {
          status: 500,
          message: "Pharmacy not found!"
        }
      end
    rescue => e
      render json: {
        status: 500,
        message: e.message
      }
    end
  end

  private
    def set_pharmacy
      @pharmacy = Pharmacy.find(params[:id])
    end

    def pharmacy_params
      params.require(:pharmacy).permit(:name, :city)
    end
end
