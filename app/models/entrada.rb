class Entrada < ActiveRecord::Base
  
  has_many :entrada_items
  
  accepts_nested_attributes_for :entrada_items, :reject_if => lambda { |a| a[:qtd].blank? }, :allow_destroy => true
  
  before_save :set_stock

  def set_stock
    
    if self.status == 1
      
      total_items = 0
      total_valor = 0
    
      self.entrada_items.each do |item|
        total_items = total_items + item.qtd
        #total_valor = total_valor + item.valor_unitario
        item.variation.stock = item.variation.stock + item.qtd
        item.variation.save
      end
      
      self.total_items = total_items
      self.total_valor = total_valor
      
    end
    
  end

end
