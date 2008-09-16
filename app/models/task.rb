class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string, :required
    timestamps
  end
  
  belongs_to :story

  has_many :task_assignments, :dependent => :destroy
  has_many :users, :through => :task_assignments
  
  acts_as_list :scope => :story

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator? && position.nil?
  end

  def updatable_by?(user, new)
    user.signed_up? && same_fields?(new, :story)
	  
  end

	def users_editable_by?(user)
    user.signed_up?
  end

  def deletable_by?(user)
    user.administrator?
  end

	def viewable_by?(user, field)
	  story.viewable_by?(user)
	end

end
