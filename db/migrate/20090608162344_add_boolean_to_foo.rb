class AddBooleanToFoo < ActiveRecord::Migration
  def self.up
    add_column :foos, :bool1, :boolean
    add_column :foos, :bool2, :boolean
    
    change_column :users, :state, :string, :limit => 255, :default => "inactive"
  end

  def self.down
    remove_column :foos, :bool1
    remove_column :foos, :bool2
    
    change_column :users, :state, :string, :default => "active"
  end
end
