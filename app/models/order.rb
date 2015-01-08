class Order < ActiveRecord::Base
  #relations
  has_and_belongs_to_many :product_characteristics, :join_table => "chars_order", :association_foreign_key => :chars_id, :foreign_key => :order_id
  belongs_to :customer, :class_name => "User"

  #validations

  
end
