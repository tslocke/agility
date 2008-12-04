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
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.signed_up? && !project_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

	def view_permitted?(attribute)
	  project.viewable_by?(acting_user)
	end

end
