class AccountController < ApplicationController
  
  before_filter :authenticate_user!
  
  def home
  end
  
  def dados
    
    @user = current_user
    store_location
        
  end
  
  def dados_update
    
        @user = current_user
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_back_or_default('/', 'Product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "dados" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
    
  end
  
  def orders
      @orders = current_user.orders
  end
  
  def order_info
    @order = Order.find_by_number_and_user_id(params[:num], current_user.id)

  end
  
end
