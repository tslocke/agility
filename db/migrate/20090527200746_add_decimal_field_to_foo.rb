class AddDecimalFieldToFoo < ActiveRecord::Migration
  def self.up
    add_column :foos, :dec, :decimal, :scale =>4, :limit => nil, :precision => 10
  end

  def self.down
    remove_column :foos, :dec
  end
end
