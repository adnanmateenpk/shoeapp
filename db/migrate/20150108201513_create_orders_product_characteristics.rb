class CreateOrdersProductCharacteristics < ActiveRecord::Migration
  def change
    create_table :product_characteristics_orders, :id=> false do |t|
      t.integer :product_characteristic_id
      t.integer :order_id
    end
    add_index :product_characteristics_orders, [order_id, product_characterisric_id]
  end
end
