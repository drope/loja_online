class CreateLogradouros < ActiveRecord::Migration
  def self.up
    create_table :logradouros do |t|
      t.integer :bairro_id
      t.integer :tipo_logradouro_id
      t.string :nome
      t.integer :cep

      t.timestamps
    end
    
    add_index :logradouros, :cep
    
  end

  def self.down
    drop_table :logradouros
  end
end
