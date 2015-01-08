class CreateCharsOrders < ActiveRecord::Migration
  def change
    create_table :chars_orders do |t|
      t.integer :chars_id
      t.integer :order_id
      t.integer :quantity
      t.timestamps null: false
    end
    add_index :chars_orders,[:chars_id, :order_id]
  end
end
