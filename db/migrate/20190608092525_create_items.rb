class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :rate, null: false
      t.references :item_category, foreign_key: true

      t.timestamps
    end
  end
end
