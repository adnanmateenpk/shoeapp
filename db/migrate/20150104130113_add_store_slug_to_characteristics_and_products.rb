class AddStoreSlugToCharacteristicsAndProducts < ActiveRecord::Migration
  def up
    add_column("products","slug", :string)
    add_index("products","slug")
  end

  def down
    remove_index("products","slug")
    remove_column("products","slug")
  end
end
