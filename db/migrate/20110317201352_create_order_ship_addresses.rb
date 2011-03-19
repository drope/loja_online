class CreateOrderShipAddresses < ActiveRecord::Migration
  def self.up
    create_table :order_ship_addresses do |t|
      t.integer :order_id, :null => false
      t.string :cep
      t.string :endereco
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end

    add_index :order_ship_addresses, :order_id    
    
  end

  def self.down
    drop_table :order_ship_addresses
  end
end
