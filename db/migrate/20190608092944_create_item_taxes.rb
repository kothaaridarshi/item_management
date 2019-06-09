class CreateItemTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :item_taxes do |t|
      t.string :name, null: false
      t.integer :tax_type, null: false, default: 0
      t.float :tax, null: false
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
