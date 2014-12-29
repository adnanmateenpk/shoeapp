class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model_name
      t.text :description
      t.string :sku
      t.boolean :status
      t.timestamps null: false
    end
  end
end
