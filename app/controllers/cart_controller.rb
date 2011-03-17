class CartController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:checkout]
  
  def add
    
    product = Product.find(params[:product_id])
    variation = Variation.find_by_product_id_and_color_id_and_size_id(params[:product_id], params[:color_id], params[:size_id])
    
    if (!product.nil? && !variation.nil?)
      
      
      ct = cookies.signed[:ct] || {}
      
#      return render :text => ct
      
      items = ct[:items] || []

       # return render :text => "The object is #{items.length}"
#        return render :text => "The object is #{variation.color.id}"
      
#      items << { :product_id => product.id.to_s, :color_id => variation.color.id.to_s, :size_id => variation.size.id.to_s }
      items << { :variation_id => variation.id.to_s }
      
      cookies.permanent.signed[:ct] = { :value => {:items => items}}
      
      redirect_to(sacola_list_path)
      #render :text => cookies.signed[:ct] 

      
    end
    
  end
  
  def list
    
    @variations = []
    ct = cookies.signed[:ct] || {}
    items = ct[:items] || []
    
    items.each do |item|
      @var = Variation.find(item[:variation_id])
      @variations << {:variation => Variation.find(item[:variation_id])}
    end
    
         @var = Variation.find(13)
#    render :text => @variations[0][:variation]
#    render :text => @var.product.name
#render :xml => @variations
  end

  
  def checkout
    
    @variations = []
    ct = cookies.signed[:ct] || {}
    items = ct[:items] || []
    
    items.each do |item|
      @var = Variation.find(item[:variation_id])
      @variations << {:variation => Variation.find(item[:variation_id])}
    end

    
  end
  
  def frete
    
    cep = params[:cep]
    logradouro = Logradouro.find_by_cep cep
    
    render :json => { :status => 1, :data => { :val => 13.50}}
    
  end
  

end
