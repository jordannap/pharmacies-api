class Order < ApplicationRecord
  belongs_to :pharmacy
  belongs_to :laboratory
end
