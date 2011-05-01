class Order < ActiveRecord::Base
  
  has_one :order_ship_address

  has_many :order_items
  has_many :order_histories
  
  belongs_to :user
  belongs_to :order_status  
end
