class OrderManageService

  def initialize(pharmacy, laboratory, order, productListParams)
      @pharmacy = pharmacy
      @laboratory = laboratory
      @order = order
      @productListParams = productListParams
  end

  def manage_order
      new_product_list = []
      @productListParams.each do |list|
          list = ProductList.create!(product_id: list[:ordered_product_id], laboratory_id: @laboratory.id, pharmacy_id: @pharmacy.id, order_id: @order.id, quantity: list[:quantity], total_cost: list[:price]*list[:quantity])
          new_product_list << list
      end
      total_cost = new_product_list.pluck(:total_cost).sum
      total_quantity = new_product_list.pluck(:quantity).sum
      @order.update!(total_cost: total_cost, total_quantity: total_quantity)
      return {status: 200}
  end
end
