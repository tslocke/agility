class AddProjectMemberships < ActiveRecord::Migration
  def self.up
    create_table :project_memberships do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean  :contributor
      t.integer  :project_id
      t.integer  :user_id
    end
  end

  def self.down
    drop_table :project_memberships
  end
end
