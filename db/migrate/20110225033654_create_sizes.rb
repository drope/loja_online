class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|
      t.integer :product_id
      t.string  :size
      t.integer :sizeBust
      t.integer :sizeSleeve
      t.integer :sizeWaist
      t.integer :sizeHip
      t.integer :sizeThigh
      t.integer :sizeInseam
      
      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end
