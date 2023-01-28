class LabInventory < ApplicationRecord
  belongs_to :lab_products, class_name: "Product", foreign_key: :product_id
	belongs_to :laboratory, class_name: "Laboratory", foreign_key: :laboratory_id
end
