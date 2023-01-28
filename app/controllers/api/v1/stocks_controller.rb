class Api::V1::StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render json: {
      status: 200,
      stocks: @stocks
    }
  end
end
