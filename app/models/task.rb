class Task < ActiveRecord::Base

  hobo_model

  fields do
    description :string
    timestamps
  end
  
  acts_as_list :scope => :story
  
  belongs_to :story

  has_many :task_assignments, :dependent => :destroy
  has_many :users, :through => :task_assignments, :managed => true
  

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest? && position.nil?
  end
  
  def users_editable_by?(user)
    !user.guest?
  end

  def updatable_by?(user, new)
    !user.guest? && story == new.story
  end

  def deletable_by?(user)
    !user.guest?
  end

  def viewable_by?(user, field)
    true
  end

end
