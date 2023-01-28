class Order < ApplicationRecord
  has_many :product_lists, dependent: :destroy
	has_many :ordered_products, class_name: "Product", through: :product_lists
	belongs_to :pharmacy
	belongs_to :laboratory

	after_update :update_pharmacy_stock


	def update_pharmacy_stock
	  product_lists = self.product_lists
	  pharmacy = Pharmacy.find(self.pharmacy_id)
	  product_lists.each do |list|
	    stock = pharmacy.stocks.find_by(product_id: list.product_id, pharmacy_id: pharmacy.id)
	    if stock.present?
	  	  stock.update!(quantity: stock.quantity + list.quantity)
	    else
		    Stock.create!(pharmacy_id: pharmacy.id, product_id: list.product_id, quantity: list.quantity, price: list.total_cost/list.quantity)
	    end
	  end
	  end
end
