# == Schema Information
# Schema version: 20110221040017
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  code        :string(255)     not null
#  listPrice   :decimal(8, 2)
#  price       :decimal(8, 2)   not null
#  costPrice   :decimal(8, 2)
#  is_active   :boolean
#  is_promo    :boolean
#  is_new      :boolean
#  sizes       :string(255)     not null
#  sizeType    :string(255)     not null
#  description :string(255)
#  composition :string(255)
#  sizeBust    :integer
#  sizeSleeve  :integer
#  sizeWaist   :integer
#  sizeHip     :integer
#  sizeThigh   :integer
#  sizeInseam  :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  
    belongs_to :category
  
end
