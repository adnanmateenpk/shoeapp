class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :address
      t.integer :visits
      t.timestamps null: false
    end
  end
end
