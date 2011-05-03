class CreateEntradas < ActiveRecord::Migration
  def self.up
    create_table :entradas do |t|
      t.integer :status, :null => false
      t.datetime :dt_conclusao
      t.decimal :total_valor, :precision => 8, :scale => 2
      t.integer :total_items

      t.timestamps
    end
    
    add_index :entradas, [:status]
    
  end

  def self.down
    drop_table :entradas
  end
end
