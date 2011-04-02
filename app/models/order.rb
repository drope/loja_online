class Order < ActiveRecord::Base
  
  has_one :order_ship_address
  has_one :order_status
  has_many :order_items
  has_many :order_histories
  
end
