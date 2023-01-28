class Api::V1::LabInventoriesController < ApplicationController

  before_action :set_lab_inventory, only: %i[show update destroy]

  def index
    @lab_inventories = LabInventory.all
    render json: {
      status: 200,
      lab_inventories: @lab_inventories
    }
  end

  def show
    render json: {
      status: 200,
      lab_inventory: @lab_inventory
    }
  end

  def create
    @lab_inventory = LabInventory.new(lab_inventory_params)

    if @lab_inventory.save
      render json: {
        status: 200,
        lab_inventory: @lab_inventory
      }
    else
      render json: {
        message: @lab_inventory.errors,
        status: :unprocessable_entity
      }
    end
  end

  def update
    if @lab_inventory.update(lab_inventory_params)
      render json: {
        status: 200,
        lab_inventory: @lab_inventory
      }
    else
      render json: @lab_inventory.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @lab_inventory.destroy
    render json: {
      status: 200,
      message: "lab inventory destoyed!"
    }
  end

  private

  def set_lab_inventory
    @lab_inventory = LabInventory.find(params[:id])
  end


  def lab_inventory_params
    params.require(:lab_inventory).permit(:product_id, :laboratory_id, :quantity, :per_unit_cost)
  end
end
