class CreateOrderItems < ActiveRecord::Migration
  def self.up
    create_table :order_items do |t|
      t.integer :order_id, :null => false
      t.integer :variation_id, :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false

      t.timestamps
    end
    
    add_index :order_items, :order_id    

  end

  def self.down
    drop_table :order_items
  end
end
