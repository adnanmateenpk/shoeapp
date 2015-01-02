class AddColumnToProduct < ActiveRecord::Migration
  def up
  rename_column("products","model_name","mod_name")
  end

  def down
    rename_column("products","mod_name","model_name")
  end
end
