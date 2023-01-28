class Api::V1::SalesController < ApplicationController

  def index
    @sales = Sale.all
    render json: {
      status: 200,
      sales: @sales
    }
  end
end
