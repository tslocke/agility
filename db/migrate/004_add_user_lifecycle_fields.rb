class AddUserLifecycleFields < ActiveRecord::Migration
  def self.up
    add_column :users, :state, :string
    add_column :users, :key_timestamp, :datetime
    add_column :users, :email_address, :string
  end

  def self.down
    remove_column :users, :state
    remove_column :users, :key_timestamp
    remove_column :users, :email_address
  end
end
