class Order < ActiveRecord::Base
  #relations
  belongs_to :customer, :class_name => "User",:foreign_key => "user_id"
  has_many :char_orders, :foreign_key => "order_id"
  has_many :product_characteristics, :through => :chars_orders
  #validations
  validates :tracking_no, :presence => true, :uniqueness => true
  validates :total_price, :presence => true

end
