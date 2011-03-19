class CreateOrderHistories < ActiveRecord::Migration
  def self.up
    create_table :order_histories do |t|
      t.integer :order_id, :null => false
      t.integer :order_status_id
      t.string :description

      t.timestamps
    end
    
    add_index :order_histories, :order_id
    
  end

  def self.down
    drop_table :order_histories
  end
end
