# == Schema Information
# Schema version: 20110221040017
#
# Table name: assets
#
#  id             :integer         not null, primary key
#  name           :string(255)     not null
#  img_swatch     :string(255)
#  img_full       :string(255)
#  img_thumb      :string(255)
#  img_zoom       :string(255)
#  imageable_id   :integer
#  imageable_type :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Asset < ActiveRecord::Base
  
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :photo,
        :storage => :s3,
        :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
        :path => "/assets/:imageable_type/:imageable_id/:style/:filename",
        :url => "/assets/:imageable_type/:imageable_id/:style/:filename",
        :styles => {
              :thumb      => "45x60#",
              :related    => "90x120#",
              :small      => "150x200#",
              :cat_list   => "193x257#",
              :medium     => "240x320#" }
        
  
  
end
