# == Schema Information
# Schema version: 20110221040017
#
# Table name: colors
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  product_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Color < ActiveRecord::Base
  
  belongs_to :product
  
end
