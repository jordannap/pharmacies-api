class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
	has_many :sales
	has_many :product_lists
	has_many :stocks
	has_many :lab_inventories
	has_many :laboratories, class_name: "Laboratory", :through =>  :lab_inventories
	has_many :stockers, class_name: "Pharmacy", foreign_key: :pharmacy_id, through: :stocks
	has_many :sellers, class_name: "Pharmacy", foreign_key: :pharmacy_id, through: :sales
end
