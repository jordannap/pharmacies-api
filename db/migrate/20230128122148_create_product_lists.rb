class CreateProductLists < ActiveRecord::Migration[7.0]
  def change
    create_table :product_lists do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :laboratory, null: false, foreign_key: true
      t.integer :total_cost
      t.integer :quantity
      t.references :pharmacy, null: false, foreign_key: true
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
