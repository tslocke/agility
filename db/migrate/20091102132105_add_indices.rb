class AddIndices < ActiveRecord::Migration
  def self.up
    add_index :task_assignments, [:user_id]
    add_index :task_assignments, [:task_id]
    
    change_column :foos, :tt, :text, :limit => 16777215
    change_column :foos, :dec, :decimal, :scale => 4, :limit => nil, :precision => 10
    change_column :foos, :dt, :datetime, :null => true, :default => nil
    
    add_index :bars, [:foo_id]
    
    add_index :projects, [:owner_id]
    
    add_index :project_memberships, [:project_id]
    add_index :project_memberships, [:user_id]
    
    add_index :tasks, [:story_id]
    
    add_index :stories, [:project_id]
    add_index :stories, [:status_id]
  end

  def self.down
    remove_index :task_assignments, :name => :index_task_assignments_on_user_id
    remove_index :task_assignments, :name => :index_task_assignments_on_task_id
    
    change_column :foos, :tt, :text
    change_column :foos, :dec, :integer, :limit => 10, :precision => 10, :scale => 0
    change_column :foos, :dt, :datetime, :default => '1970-01-01 07:01:01', :null => false
    
    remove_index :bars, :name => :index_bars_on_foo_id
    
    remove_index :projects, :name => :index_projects_on_owner_id
    
    remove_index :project_memberships, :name => :index_project_memberships_on_project_id
    remove_index :project_memberships, :name => :index_project_memberships_on_user_id
    
    remove_index :tasks, :name => :index_tasks_on_story_id
    
    remove_index :stories, :name => :index_stories_on_project_id
    remove_index :stories, :name => :index_stories_on_status_id
  end
end
