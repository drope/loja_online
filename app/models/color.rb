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
  has_many :assets, :as => :imageable
  accepts_nested_attributes_for :assets, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  
  
  has_attached_file :swatch,
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/assets/Color/:id/swatch/:style/:filename",
    :url => "/assets/Color/:id/swatch/:style/:filename"
  
end
