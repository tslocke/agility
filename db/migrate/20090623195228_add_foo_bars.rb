class AddFooBars < ActiveRecord::Migration
  def self.up
    create_table :bars do |t|
      t.string  :name
      t.integer :foo_id
    end
  end

  def self.down
    drop_table :bars
  end
end
