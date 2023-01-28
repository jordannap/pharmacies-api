class Api::V1::LaboratoriesController < ApplicationController
  before_action :set_laboratory, only: %i[ show update destroy ]

  def index
    @laboratories = Laboratory.all
    render json: {
      status: 200,
      laboratories: @laboratories
    }
  end

  def show
    render json: {
      status: 200,
      laboratory: @laboratory,
      products: @laboratory.lab_products
    }
  end

  def create
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      render json: {
        status: 200,
        laboratory: @laboratory
      }
    else
      render json: {
        message: @laboratory.errors,
        status: :unprocessable_entity
      }
    end
  end

  def update
    if @laboratory.update(laboratory_params)
      render json: {
        status: 200,
        laboratory: @laboratory
      }
    else
      render json: @laboratory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /laboratories/1
  def destroy
    @laboratory.destroy
    render json: {
      status: 200,
      message: "laboratory destoyed!"
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laboratory
      @laboratory = Laboratory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def laboratory_params
      params.require(:laboratory).permit(:name, :city)
    end
end
