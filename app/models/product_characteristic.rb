class ProductCharacteristic < ActiveRecord::Base
  #relations
  belongs_to :product

  #validations
  validates :price, :numericality => true, :presence => true

  validates :size, :presence => true

  validates :color, :presence => true

  validates :slug, :uniqueness => true

end
