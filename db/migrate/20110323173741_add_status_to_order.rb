class AddStatusToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :order_status_id, :integer
  end

  def self.down
    remove_column :orders, :order_status_id
  end
end
