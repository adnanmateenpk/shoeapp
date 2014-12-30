class ProductCharacteristic < ActiveRecord::Base
belongs_to :product
validates :price, :numericality => true, :presence => true,
validates :size, :presence => true,
validates :color, :presence => true,
end
