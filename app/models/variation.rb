class Variation < ActiveRecord::Base

  belongs_to :product
  belongs_to :color
  belongs_to :size
  
  default_scope :include => [:color,:product,:size], :order => "products.code, colors.name, sizes.position ASC"
    
  def desc
    "#{product.code}.#{color.name}.#{size.size}" 
  end

end
