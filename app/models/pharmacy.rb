class Pharmacy < ApplicationRecord
  has_many :stocks, dependent: :destroy
	has_many :sales, dependent: :destroy
	has_many :orders, dependent: :destroy
	has_many :product_lists, dependent: :destroy
	has_many :ordered_products, through: :orders
	has_many :stock_products, class_name: "Product", foreign_key: :product_id, through: :stocks
	has_many :sold_products, class_name: "Product", foreign_key: :product_id, through: :sales
end
