class Story < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title :string
    body :html
    timestamps
  end
  
  belongs_to :project
  belongs_to :status, :class_name => "StoryStatus"

  has_many :tasks, :dependent => :destroy, :order => :position, :accessible => true


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
    raise 'bug468' if project.nil? || project_id != project.id
    project.viewable_by?(acting_user)
  end

end
