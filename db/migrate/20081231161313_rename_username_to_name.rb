class RenameUsernameToName < ActiveRecord::Migration
  def self.up
    rename_column :users, :username, :name
  end

  def self.down
    rename_column :users, :name, :username
  end
end
