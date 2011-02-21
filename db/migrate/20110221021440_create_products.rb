class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      
      t.string  :name, :null => false
      t.string  :code, :null => false
      t.decimal :listPrice, :precision => 8, :scale => 2
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.decimal :costPrice, :precision => 8, :scale => 2
      t.boolean :is_active, :default => false
      t.boolean :is_promo, :default => false
      t.boolean :is_new, :default => false
      t.string  :sizes, :null => false
      t.string  :sizeType, :null => false
      t.string  :description
      t.string  :composition
      t.integer :sizeBust
      t.integer :sizeSleeve
      t.integer :sizeWaist
      t.integer :sizeHip
      t.integer :sizeThigh
      t.integer :sizeInseam
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
