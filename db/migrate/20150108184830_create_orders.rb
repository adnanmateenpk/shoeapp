class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :tracking_no
      t.integer :user_id
      t.integer :status
      t.float :total_price
      t.timestamps null: false
    end
  end
  add_index :orders, :user_id
  add_index :orders, :tracking_no
end
