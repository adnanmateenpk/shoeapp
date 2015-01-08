class CharsOrder < ActiveRecord::Base
  #relations
  belongs_to :order
  belongs_to :product_characteristic, :foreign_key => "chars_id"

  #validations
  validates :quantity, :numericality => {:only_integer=>true, :greater_than=>0}

end
