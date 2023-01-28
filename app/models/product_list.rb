class ProductList < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :laboratory
  belongs_to :pharmacy
  belongs_to :sale
end
