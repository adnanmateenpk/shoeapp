class CreateProductCharacteristics < ActiveRecord::Migration
  def change
    create_table :product_characteristics do |t|
      t.float :price
      t.integer :size
      t.string :color
      t.string :image
      t.timestamps null: false
    end
  end
end
