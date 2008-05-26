class Story < ActiveRecord::Base

  hobo_model

  fields do
    title :string
    body :markdown
    timestamps
  end

  belongs_to :project
  
  belongs_to :status, :class_name => "StoryStatus", :foreign_key => "status_id"

  has_many :tasks, :order => 'position', :dependent => :destroy

  def writable_by?(user)
    project.accepts_changes_from?(user)
  end
  
  # --- Hobo Permissions --- #

  def creatable_by?(user)
    writable_by?(user)
  end
  
  def status_editable_by?(user)
    writable_by?(user)
  end

  def updatable_by?(user, new)
    writable_by?(user) && same_fields?(new, :project)
  end

  def deletable_by?(user)
    writable_by?(user)
  end

  def viewable_by?(user, field=nil)
    project.viewable_by?(user)
  end

end
