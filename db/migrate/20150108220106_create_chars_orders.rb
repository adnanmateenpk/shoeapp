class CreateCharsOrders < ActiveRecord::Migration
  def change
    create_table :chars_orders do |t|

      t.timestamps null: false
    end
  end
end
