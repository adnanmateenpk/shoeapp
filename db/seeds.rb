# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create(email: 'hector@admin.com', password: 'adminpassword')



WebsiteSetting.create(:title=>"Shoe Shop",:email=>"shoe@shop.com", :stripe_secret_key =>"secret_key",:stripe_publishable_key =>"publishable_key")
