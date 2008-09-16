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

  def creatable_by?(user)
    user.administrator?
  end

  def updatable_by?(user, new)
    user.signed_up? && same_fields?(new, :project)
  end

  def deletable_by?(user)
    user.administrator?
  end

	def viewable_by?(user, field=nil)
	  project.viewable_by?(user)
	end

end
