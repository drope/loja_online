class CartController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:checkout]
  
  def add
    
    variation = Variation.find_by_product_id_and_color_id_and_size_id(params[:product_id], params[:color_id], params[:size_id])
    if (!variation.nil?)
      add_product_to_cart variation.id
    end
    redirect_to(sacola_path)
        
  end

  def remove
    
    remove_product_from_cart params[:id]
    redirect_to(sacola_path)
    
  end
  
  def list
    
    @variations = get_variations_from_cart
    @total = calculate_variations_total_price @variations
    @cep = get_session_cep
    @frete_type = get_session_frete
#    render :json => @cep
    @frete = []
    if !@cep.nil? 
      logradouro = Logradouro.find_by_cep @cep
      if !logradouro.nil?
        @frete = logradouro.shipping_rates 
      end
    end
    
    
  end

  
  def checkout
    
    @variations = get_variations_from_cart
    @total = calculate_variations_total_price @variations
    
    @cep = current_user.user_address.cep

    @frete_type = get_session_frete
    logradouro = Logradouro.find_by_cep @cep.tr("-","")
    @frete = logradouro.shipping_rates
    
    
    if @variations.blank?
      return
    end
    
    pre_order = PreOrder.find_by_user_id_and_status(current_user.id, 0)
    
    if (pre_order.blank?)
      pre_order = PreOrder.new(
        :user_id => current_user.id,
        :status => 0,
        :total => @total
      )
      pre_order.save      
    else
      
      pre_order_items = PreOrderItem.find_all_by_pre_order_id(pre_order.id)
      pre_order_items.each do |po|
        variation = Variation.find(po.variation_id)
        variation.stock = variation.stock + 1
        variation.save
        po.destroy
      end  
    end
    
    @variations.each do |v|
      
      variation = Variation.find(v[:variation].id)
      if (variation.stock > 0)
        
        item = PreOrderItem.new(
          :pre_order_id => pre_order.id,
          :variation_id => v[:variation].id,
          :price => v[:variation].product.price,
          :qtd => 1
        )
        item.save
        
        variation.stock = variation.stock - 1
        variation.save
      else

        remove_product_from_cart variation.id
        flash[:warning] = "Item removido do carrinho"
        @variations.delete(v)

      end  
    end
    
    @total = calculate_variations_total_price @variations
    pre_order[:total] = @total
    pre_order.save
    

#        render :json => @variations        
    #UserMailer.welcome(current_user).deliver
    
  end
  
  def set_frete
    save_session_frete params[:type]
    render :json => { 
      :status => 1,
      :data => get_session_frete
    }
  end
  
  def frete
    
    cep = params[:cep]
    cep["-"] = ""
    logradouro = Logradouro.find_by_cep cep
    
    if (!logradouro.nil?)
      save_session_cep cep
      render :json => { 
        :status => 1, 
        :data => logradouro.shipping_rates 
      }
    else
      render :json => { 
        :status => -1, 
        :data => ""
      }
    end
  end
  
  def logradouro_by_cep
    
    cep = params[:cep]
    cep["-"] = ""
    logradouro = Logradouro.find_by_cep cep
    
    if (!logradouro.blank?)
      render :json => { 
        :status => 1, 
        :data => {
          :endereco => logradouro.nome,
          :bairro => logradouro.bairro.nome,
          :cidade => logradouro.bairro.cidade.nome,
          :estado => logradouro.bairro.cidade.uf.sigla
        }
      }
    else 
      render :json => { 
        :status => -1, 
        :data => 'cep nao encontrado'
      }
    end
    
  end
  
  def placeOrder
    
    number = (0..9).to_a.shuffle[0..7].join
    variations = get_variations_from_cart
    totalItems = calculate_variations_total_price variations
    
    order = Order.new(
      :number => number,
      :user_id => current_user.id,
      :totalItems=> totalItems,
      :totalOrder => totalItems + Float(params[:shipping_val]),
      :totalShipping => params[:shipping_val],
      :shipping_type => params[:shipping_type],
      :shipping_estimate => params[:shipping_estimate],
      :payment_type => params[:payment_type],
      :order_status_id => 2
    )
    order.save
    
    address = OrderShipAddress.new(
      :order_id => order.id,
      :cep => current_user.user_address.cep,
      :endereco => current_user.user_address.endereco,
      :numero => current_user.user_address.numero,
      :complemento => current_user.user_address.complemento,
      :bairro => current_user.user_address.bairro,
      :cidade => current_user.user_address.cidade,
      :estado => current_user.user_address.estado
    )
    address.save
    
    variations.each do |v|
      item = OrderItem.new(
        :order_id => order.id,
        :variation_id => v[:variation].id,
        :price => v[:variation].product.price,
        :qtd => 1
      )
      item.save
    end
    
    OrderHistory.new(
      :order_id => order.id,
      :order_status_id => 1
    ).save
    OrderHistory.new(
      :order_id => order.id,
      :order_status_id => 2
    ).save
    
    pre_order = PreOrder.find_by_user_id_and_status(current_user.id, 0)
    pre_order[:status] = 1
    pre_order.save
    empty_cart
    
    render :json => { :status => 1, :data => { :order_number => order.number, :payment_type => params[:payment_type]}}
    
  end

end