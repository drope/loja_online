class AddIsDestaqueHomeToProduct < ActiveRecord::Migration
  def self.up
    
    add_column :products, :is_destaque_home, :boolean
    
  end

  def self.down
    
    
    remove_column :products, :is_destque_home
    
  end
end
