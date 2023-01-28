class Laboratory < ApplicationRecord
  has_many :orders, dependent: :destroy
	has_many :ordered_products, through: :orders
	has_many :lab_inventories
	has_many :product_lists
	has_many :lab_products, class_name: "Product", foreign_key: :product_id, through: :lab_inventories
end
