class CreateOrdersProductCharacteristics < ActiveRecord::Migration
  def change
    create_table :chars_orders, :id => false do |t|
      t.integer :chars_id
      t.integer :order_id
    end
    add_index :chars_orders, [:chars_id,:order_id]
    
  end
end
