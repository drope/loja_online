class AccountController < ApplicationController
  
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
  
end
