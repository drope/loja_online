class AddPhoneToUserInfo < ActiveRecord::Migration
  def self.up
    add_column :user_infos, :phone_ddd, :string
    add_column :user_infos, :phone_number, :string
  end

  def self.down
    remove_column :user_infos, :phone_number
    remove_column :user_infos, :phone_ddd
  end
end
