class AddPositionToProduct < ActiveRecord::Migration

  def up
    add_column("products","position", :integer)
    add_index("products","position")
  end

  def down
    remove_index("products","position")
    remove_column("products","position")
  end

end
