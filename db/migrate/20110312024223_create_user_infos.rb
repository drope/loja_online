class CreateUserInfos < ActiveRecord::Migration
  def self.up
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :name
      t.string :cpf

      t.timestamps
    end
    
    add_index :user_infos, :user_id
    
  end

  def self.down
    drop_table :user_infos
  end
end
