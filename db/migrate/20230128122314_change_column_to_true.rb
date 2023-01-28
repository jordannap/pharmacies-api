class ChangeColumnToTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :product_lists, :laboratory_id, :bigint, null: true
	  change_column :product_lists, :pharmacy_id, :bigint, null: true
	  change_column :product_lists, :product_id, :bigint, null: true
	  change_column :product_lists, :order_id, :bigint, null: true
  end
end
