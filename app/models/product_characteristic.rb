class ProductCharacteristic < ActiveRecord::Base

  #relations
  belongs_to :product
  has_many :chars_orders, :foreign_key =>"chars_id"
  has_many :orders, :through => :chars_orders
  #validations
  validates :price, :numericality => true, :presence => true

  validates :size, :presence => true

  validates :color, :presence => true

  validates :slug, :uniqueness => true

end
