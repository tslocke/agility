class AddDecimalFieldToFoo < ActiveRecord::Migration
  def self.up
    add_column :foos, :dec, :decimal
  end

  def self.down
    remove_column :foos, :dec
  end
end
