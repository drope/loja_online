class Size < ActiveRecord::Base
  belongs_to :product
  default_scope :order => "created_at ASC"
end
