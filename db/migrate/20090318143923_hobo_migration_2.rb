class HoboMigration2 < ActiveRecord::Migration
  def self.up
    add_column :stories, :due, :date
  end

  def self.down
    remove_column :stories, :due
  end
end
