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
    
  
    @super_destaques = Product.find_all_by_is_highlight(true,:order => 'created_at DESC') 
    
    @super_destaques = @super_destaques[0..2]
    
  end

  def product
    
    @product = Product.find(params[:id])

    @related_products = Product.all


    
  end
  
  def category
    
    @products = Product.find_all_by_category_id(params[:id])
    
#    3.times do
#      @products << Product.find(4)
#      @products << Product.find(5)
#    end
    
  end
  
  def medidas
  end
  
  def trocas_devolucoes
  end
  
  def prazo_entrega
  end
  
  def ajuda
  end
  
  def privacidade
  end
  def seguranca
  end
  def fale_conosco
  end
  def quem_somos
  end
  def perguntas_frequentes
  end
  def formas_de_pagamento
  end
  
  

end
