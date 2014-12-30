class Product < ActiveRecord::Base
has_many :product_characteristics
validates :model_name, :presence => true,
:length => { :maximum => 25 }
validates :sku, :uniqueness => true, :presence => true
validates :position, :numericality =>{:only_integer => true}, :presence => true
end
