class CreatePreOrderItems < ActiveRecord::Migration
  def self.up
    create_table :pre_order_items do |t|
      t.integer :pre_order_id, :null => false
      t.integer :variation_id, :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.integer :qtd, :null => false

      t.timestamps
    end
    
    add_index :pre_order_items, :pre_order_id
        
  end

  def self.down
    drop_table :pre_order_items
  end
end
