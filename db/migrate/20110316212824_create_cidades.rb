class CreateCidades < ActiveRecord::Migration
  def self.up
    create_table :cidades do |t|
      t.integer :uf_id
      t.string :nome

      t.timestamps
    end
    
    add_index :cidades, :uf_id
    
  end

  def self.down
    drop_table :cidades
  end
end
