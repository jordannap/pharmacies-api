class Api::V1::ProductListsController < ApplicationController

  def index
    @product_lists = ProductLists.all
    render json:  {
      status: 200,
      product_lists: @product_lists
    }
   end
end
