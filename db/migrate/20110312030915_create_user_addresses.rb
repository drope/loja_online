class CreateUserAddresses < ActiveRecord::Migration
  def self.up
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :cep
      t.string :endereco
      t.string :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
    
    add_index :user_addresses, :user_id
    
  end

  def self.down
    drop_table :user_addresses
  end
end
