class Task < ActiveRecord::Base

  hobo_model

  fields do
    description :string
    timestamps
  end
  
  acts_as_list :scope => :story
  
  belongs_to :story
  
  delegate :project, :writable_by?, :to => :story

  has_many :task_assignments, :dependent => :destroy
  has_many :users, :through => :task_assignments, :managed => true
  

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    writable_by?(user) && position.nil?
  end
  
  def users_editable_by?(user)
    writable_by?(user)
  end

  def updatable_by?(user, new)
    writable_by?(user) && same_fields?(new, :story)
  end

  def deletable_by?(user)
    writable_by?(user)
  end

  def viewable_by?(user, field)
    story.viewable_by?(user)
  end

end
