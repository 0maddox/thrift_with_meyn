class CreateClothingItems < ActiveRecord::Migration[7.0]
  def change
    create_table :clothing_items do |t|
      t.string :name
      t.text :description
      t.string :size
      t.string :color
      t.decimal :price
      t.string :picture
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
