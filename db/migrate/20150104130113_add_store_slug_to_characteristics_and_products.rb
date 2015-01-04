class AddStoreSlugToCharacteristicsAndProducts < ActiveRecord::Migration
  def up
    add_column("products","slug", :string)
    add_index("products","slug")
    add_column("product_characteristics","slug", :string)
    add_index("product_characteristics","slug")
  end

  def down
  	remove_index("product_characteristics","slug")
    remove_column("product_characteristics","slug")
    remove_index("products","slug")
    remove_column("products","slug")
  end
end
