class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :owner_id
    end
    
    create_table :project_memberships do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :user_id
    end
    
    create_table :stories do |t|
      t.string   :title
      t.text     :body
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
      t.integer  :status_id
    end
    
    create_table :story_statuses do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :tasks do |t|
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :story_id
      t.integer  :position
    end
    
    create_table :task_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :task_id
    end
    
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :username
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
  end

  def self.down
    drop_table :projects
    drop_table :project_memberships
    drop_table :stories
    drop_table :story_statuses
    drop_table :tasks
    drop_table :task_assignments
    drop_table :users
  end
end
