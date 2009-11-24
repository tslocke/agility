class Story < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    body :html
    timestamps
  end
  
  belongs_to :project
	belongs_to :status, :class_name => "StoryStatus"
  
  has_many :tasks, :dependent => :destroy, :order => :position


  # --- Hobo Permissions --- #

  def create_permitted?
    project.creatable_by?(acting_user)
  end

  def update_permitted?
    project.updatable_by?(acting_user)
  end

  def destroy_permitted?
    project.destroyable_by?(acting_user)
  end

  def view_permitted?(attribute)
    require 'ruby-debug'
    debugger if project_id.nil?
    project.viewable_by?(acting_user)
  end

end
