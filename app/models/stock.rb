class Stock < ApplicationRecord
  belongs_to :stocker, class_name: "Pharmacy", foreign_key: :pharmacy_id
	belongs_to :stock_product, class_name: "Product", foreign_key: :product_id
end
