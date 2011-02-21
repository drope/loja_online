class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      
      t.string  :name, :null => false
      
      t.string  :img_swatch
      t.string  :img_full
      t.string  :img_thumb
      t.string  :img_zoom
      
      t.integer :imageable_id
      t.string  :imageable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
