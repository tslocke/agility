class AddStoryIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :story_id, :integer
  end

  def self.down
    remove_column :tasks, :story_id
  end
end
