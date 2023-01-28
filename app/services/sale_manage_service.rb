class SaleManageService

  def initialize(pharmacy, sale, productListParams)
      @pharmacy = pharmacy
      @sale = sale
      @productListParams = productListParams
  end

  def create_sale
      if @productListParams.length > 0
          new_product_list = []
          @productListParams.each do |list|
              list = ProductList.create!(product_id: list[:ordered_product_id], pharmacy_id: @pharmacy.id, sale_id: @sale.id, quantity: list[:quantity], total_cost: list[:price]*list[:quantity])
              new_product_list << list
          end
          total_cost = new_product_list.pluck(:total_cost).sum
          total_quantity = new_product_list.pluck(:quantity).sum
          @sale.update!(total_cost: total_cost, total_quantity: total_quantity)
          return {status: 200}
      end
  end
end
