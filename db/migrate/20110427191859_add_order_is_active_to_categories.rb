class AddOrderIsActiveToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :order, :integer
    add_column :categories, :is_active, :boolean
    
    add_index :categories, :is_active
  end

  def self.down
    remove_column :categories, :is_active
    remove_column :categories, :order
    
    remove_index :categories, :is_active
  end
end
