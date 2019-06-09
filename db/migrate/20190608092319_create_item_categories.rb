class CreateItemCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :item_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
