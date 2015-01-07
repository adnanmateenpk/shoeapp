class Product < ActiveRecord::Base
	#gems
	acts_as_list
	#scopes
	scope :sorted, lambda { order("products.position ASC") }
	#relations
	has_many :product_characteristics


	#validations
	validates :mod_name,	:presence => true,
							:length => { :maximum => 25 }

	validates :sku, 		:uniqueness => true,
							:presence => true

	validates :position, 	:numericality =>{:only_integer => true},
							:presence => true

	validates :slug, :uniqueness => true

end
