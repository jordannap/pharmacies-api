class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :pharmacy, null: false, foreign_key: true
      t.references :laboratory, null: false, foreign_key: true
      t.integer :total_cost
      t.integer :total_quantity

      t.timestamps
    end
  end
end
