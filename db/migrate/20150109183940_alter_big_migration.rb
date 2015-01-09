class AlterBigMigration < ActiveRecord::Migration
  
  def up
  	add_column("admin_users","first_name",:string)
  	add_column("admin_users","last_name",:string)
  	add_column("users","first_name",:string)
  	add_column("users","last_name",:string)
  	add_column("products","meta_keywords",:string)
  	add_column("products","meta_description",:string)
  end
  

  def down
  	remove_column("products","meta_description")
  	remove_column("products","meta_keywords")
  	remove_column("users","last_name")
  	remove_column("users","first_name")
  	remove_column("admin_users","last_name")
  	remove_column("admin_users","first_name")
  end
end
