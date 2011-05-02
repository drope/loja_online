module CartHelper

  def count_cart_items()
    
    variations = get_variations_from_cart
    if (!variations.blank?)
      return variations.length
    else
      return 0
    end
    
  end

  def save_session_cep(cep)
    cookies.permanent.signed[:cep] = cep
  end
  
  def get_session_cep
    return cookies.signed[:cep]
  end

  def save_session_frete(type)
    cookies.permanent.signed[:frete] = type
  end
  
  def get_session_frete
    return cookies.signed[:frete] 
  end

  def add_product_to_cart(variation_id)
    
    ct = cookies.signed[:ct] || {}
    items = ct[:items] || []
    
    items.each do |item|
      if ( item[:variation_id] == variation_id.to_s )
        return
      end
    end
    
    items << { :variation_id => variation_id.to_s }      
    cookies.permanent.signed[:ct] = { :value => {:items => items}}
    
  end
  
  def remove_product_from_cart(variation_id)
          
    if (!variation_id.nil?)
            
      ct = cookies.signed[:ct] || {}
      items = ct[:items] || []
      items.delete({ :variation_id => variation_id.to_s })
      cookies.permanent.signed[:ct] = { :value => {:items => items}}
      
    end

  end
  
  def empty_cart()
    cookies.delete :ct
  end
  
  
  def get_variations_from_cart
    
    ct = cookies.signed[:ct] || {}
    items = ct[:items] || []
    variations = []
    items.each do |item|
      variations << {:variation => Variation.find(item[:variation_id])}
    end
    return variations
    
  end
  
  def calculate_variations_total_price(variations)
    
    total = 0
    variations.each do |v| 
      total += v[:variation].product.price
    end
    return total
    
  end

end
