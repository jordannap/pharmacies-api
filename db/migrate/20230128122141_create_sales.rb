class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :pharmacy, null: false, foreign_key: true
      t.integer :total_quantity
      t.integer :total_cost
      t.string :customer_name

      t.timestamps
    end
  end
end
