class HoboMigrationAddFooTestModel < ActiveRecord::Migration
  def self.up
    create_table :foos do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :i
      t.float    :f
      t.string   :s
      t.text     :tt
      t.date     :d
      t.datetime :dt
      t.text     :hh
      t.text     :tl
      t.text     :md
      t.string   :es, :default => "a"
    end
    
    add_column :users, :tester, :boolean, :default => false
  end

  def self.down
    remove_column :users, :tester
    
    drop_table :foos
  end
end
