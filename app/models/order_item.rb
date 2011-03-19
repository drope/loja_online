class OrderItem < ActiveRecord::Base
  
  belongs_to :order
  has_one :variation
  
end
