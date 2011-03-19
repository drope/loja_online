class OrderHistory < ActiveRecord::Base
  
  belongs_to :order
  has_one :order_status
  
end
