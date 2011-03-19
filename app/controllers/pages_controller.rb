class PagesController < ApplicationController
  def home
    
    cookies.permanent.signed[:cookie_perm] = "cookie permanente"
        cookies.permanent.signed[:cookie_perm2] = "cookie permanente"
    cookies.signed[:cookie_padrao] = "cookie padrao"
    session[:sessao] = "sessao"
    
    @products = Product.all

#    @products.each do |p|
#      p.colors.each do |c|
#        c.assets.first.photo.reprocess!
#      end
        
      #p.assets.first.photo.reprocess!
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
