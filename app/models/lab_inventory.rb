class LabInventory < ApplicationRecord
  belongs_to :product
  belongs_to :laboratory
end
