class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :bats do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :baz_id
    end
    add_index :bats, [:baz_id]

    change_column :foos, :tt, :text, :limit => 16777215
  end

  def self.down
    change_column :foos, :tt, :text, :limit => 2147483647

    drop_table :bats
  end
end
