class CreateVariations < ActiveRecord::Migration
  def self.up
    create_table :variations do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :color_id
      t.integer :stock

      t.timestamps
      
      
    end
    
    add_index :variations, :product_id
  end

  def self.down
    remove_index :validations, :product_id
    drop_table :variations
  end
end
