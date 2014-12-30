class AlterProductCharacteristicAddForeignKey < ActiveRecord::Migration

  def up
    add_column("product_characteristics", "product_id", :integer)
    add_index("product_characteristics", "product_id")
    end

  def down
    remove_index("product_characteristics", "product_id")
    remove_column("product_characteristics", "product_id")
    end

end
