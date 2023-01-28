class ProductList < ApplicationRecord
  belongs_to :ordered_product, class_name: "Product", foreign_key: :product_id
	belongs_to :sold_products, class_name: "Product", foreign_key: :product_id
	belongs_to :order, optional: true
	belongs_to :laboratory, optional: true
	belongs_to :pharmacy
end
