# == Schema Information
# Schema version: 20110221040017
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base

  has_many :products
  default_scope :order => "position ASC"

end
