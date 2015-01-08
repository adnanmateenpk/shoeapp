class CreateOrdersProductCharacteristics < ActiveRecord::Migration
  def change
    create_table :orders_product_characteristics, :id=> false do |t|
      t.integer :product_characteristic_id
      t.integer :order_id
    end
    add_index :order_product_characteristics, [order_id, product_characterisric_id]
  end
end
