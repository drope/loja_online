class PagesController < ApplicationController
  def home
    
    
    
    @products = Product.all

#    @products.each do |p|
#      p.assets.first.photo.reprocess!
#    end
    
    

    
    @products << Product.find(4)
    @products << Product.find(5)
  
    @super_destaques = Product.find_all_by_is_highlight(true) << Product.find(4)
  
  end

  def product
    
    @product = Product.find(params[:id])

    @related_products = Product.all
    @related_products << Product.find(4)
    @related_products << Product.find(5)
    

    
  end
  
  def category
    
    @products = Product.find_all_by_category_id(params[:id])
    
    3.times do
      @products << Product.find(4)
      @products << Product.find(5)
    end
    
  end

end
