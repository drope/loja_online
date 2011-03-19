class AddShippingInfoToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :shipping_type, :string
    add_column :orders, :shipping_estimate, :string
  end

  def self.down
    remove_column :orders, :shipping_estimate
    remove_column :orders, :shipping_type
  end
end
