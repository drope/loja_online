class AddHighlightInfoToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :is_highlight, :boolean
    add_column :products, :highlight_bg, :string
  end

  def self.down
    remove_column :products, :highlight_bg
    remove_column :products, :is_highlight
  end
end
