class StockMailer < ApplicationMailer
  default from: 'faks@example.com'

  def low_stock_alert
    stock = params[:stock]
    @product = Product.find(params[:product_id])
    @pharmacy = Pharmacy.find(stock.pharmacy_id)
    mail(to: @pharmacy.email, subject: 'Low Stock Alert!')
  end
end
