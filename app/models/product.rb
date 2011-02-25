
class Product < ActiveRecord::Base
  
  
    belongs_to :category
    has_many :colors
    accepts_nested_attributes_for :colors, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
    has_many :sizes
    accepts_nested_attributes_for :sizes, :reject_if => lambda { |a| a[:size].blank? }, :allow_destroy => true
    has_many :assets, :as => :imageable
    accepts_nested_attributes_for :assets, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
    has_many :variations
    accepts_nested_attributes_for :variations
    
    before_save :set_variations

    def set_variations
      
      self.sizes.each do |size|
        self.colors.each do |color|
          variation = Variation.find_by_size_id_and_color_id(size, color)          
          if variation.nil? && size['id'] != nil && color['id'] != nil
            variations.build(:size_id => size['id'], :color_id => color['id'], :stock => 0)
          end
          variation = nil
        end
      end
    end
end
