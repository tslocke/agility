class HoboMigration2 < ActiveRecord::Migration
  def self.up
    create_table :bazs do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :foobazs do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :foo_id
      t.integer  :baz_id
    end
    add_index :foobazs, [:foo_id]
    add_index :foobazs, [:baz_id]

    change_column :foos, :tt, :text, :limit => 16777215
  end

  def self.down
    change_column :foos, :tt, :text, :limit => 2147483647

    drop_table :bazs
    drop_table :foobazs
  end
end
