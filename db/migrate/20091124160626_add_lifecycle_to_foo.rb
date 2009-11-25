class AddLifecycleToFoo < ActiveRecord::Migration
  def self.up
    add_column :foos, :v, :boolean, :default => true
    add_column :foos, :state, :string, :default => "state1"
    add_column :foos, :key_timestamp, :datetime
    change_column :foos, :tt, :text, :limit => 16777215
    add_index :foos, [:state]

    add_index :users, [:state]
  end

  def self.down
    remove_column :foos, :v
    remove_column :foos, :state
    remove_column :foos, :key_timestamp
    change_column :foos, :tt, :text, :limit => 2147483647
    remove_index :foos, :name => :index_foos_on_state

    remove_index :users, :name => :index_users_on_state
  end
end
