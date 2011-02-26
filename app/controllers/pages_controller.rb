class PagesController < ApplicationController
  def home
  end

  def product
    
    @product = Product.find(params[:id])
    

    
  end

end
