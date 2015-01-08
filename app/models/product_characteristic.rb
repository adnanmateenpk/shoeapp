class ProductCharacteristic < ActiveRecord::Base

  #relations
  belongs_to :product
  has_and_belongs_to_many :orders, :join_table => "chars_orders", :foreign_key => :chars_id, :association_foreign_key => :order_id
  #validations
  validates :price, :numericality => true, :presence => true

  validates :size, :presence => true

  validates :color, :presence => true

  validates :slug, :uniqueness => true

end
