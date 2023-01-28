class CreateLabInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :laboratory, null: false, foreign_key: true
      t.integer :quantity
      t.integer :per_unit_cost

      t.timestamps
    end
  end
end
