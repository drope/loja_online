class CreateEntradaItems < ActiveRecord::Migration
  def self.up
    create_table :entrada_items do |t|
      t.integer :entrada_id, :null => false
      t.integer :product_id, :null => false
      t.integer :variation_id, :null => false
      t.integer :qtd, :null => false
      t.decimal :valor_unitario, :precision => 8, :scale => 2

      t.timestamps
    end
    
    add_index :entrada_items, [:entrada_id]
    add_index :entrada_items, [:product_id]
    add_index :entrada_items, [:variation_id]
    
  end

  def self.down
    drop_table :entrada_items
  end
end
