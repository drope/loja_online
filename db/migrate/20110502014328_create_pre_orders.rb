class CreatePreOrders < ActiveRecord::Migration
  def self.up
    create_table :pre_orders do |t|
      t.integer :user_id, :null => false
      t.integer :status, :null => false
      t.decimal :total, :precision => 8, :scale => 2, :null => false
      t.timestamps
    end
    
    add_index :pre_orders, [:user_id,:status]
    
  end

  def self.down
    drop_table :pre_orders
  end
end
