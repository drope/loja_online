class EntradaItem < ActiveRecord::Base
  
  belongs_to :entrada
  belongs_to :variation
  
  before_save :set_product

  def set_product
    
    self.product_id = self.variation.product.id
    
    if self.valor_unitario.blank?
      self.valor_unitario = self.variation.product.price
    end
    
  end
  
end
