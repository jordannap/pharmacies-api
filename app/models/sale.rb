class Sale < ApplicationRecord
  has_many :product_lists, dependent: :destroy
  has_many :sold_products, class_name: "Product", foreign_key: :product_id, through: :product_lists
  belongs_to :seller, class_name: "Pharmacy", foreign_key: :pharmacy_id
  after_update :update_pharmacy_stock

  def update_pharmacy_stock
    product_lists = self.product_lists
    pharmacy = Pharmacy.find(self.pharmacy_id)
    product_lists.each do |list|
      stock = pharmacy.stocks.find_by(product_id: list.product_id, pharmacy_id: pharmacy.id)
      stock.update!(quantity: stock.quantity - list.quantity)
        if stock.quantity < 5
          StockMailer.with(stock: self, product_id: list.product_id).low_stock_alert.deliver_later
        end
    end
  end
end
