class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :number, :null => false
      t.integer :user_id, :null => false
      t.decimal :totalItems, :precision => 8, :scale => 2, :null => false
      t.decimal :totalShipping, :precision => 8, :scale => 2, :null => false
      t.decimal :totalOrder, :precision => 8, :scale => 2, :null => false
      t.string :postal_tracking

      t.timestamps
    end
    
    add_index :orders, :user_id
    add_index :orders, :number
    
  end

  def self.down
    drop_table :orders
  end
end
