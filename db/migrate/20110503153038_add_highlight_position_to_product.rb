class AddHighlightPositionToProduct < ActiveRecord::Migration
  def self.up
    
    add_column :products, :highlight_position, :integer
    
  end

  def self.down
    
    remove_column :products, :highlight_position
        
  end
end
