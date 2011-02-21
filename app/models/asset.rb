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
end
