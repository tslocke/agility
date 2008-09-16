class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :required
    timestamps
  end
  
  has_many :stories, :dependent => :destroy
  
  belongs_to :owner, :class_name => "User", :creator => true
  
  has_many :memberships, :class_name => "ProjectMembership"
	has_many :members, :through => :memberships, :source => :user

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    owner == user
  end

  def updatable_by?(user, new)
    user.administrator? || (user == owner && same_fields?(new, :owner))
  end

  def deletable_by?(user)
    user.administrator? || user == owner
  end

	def viewable_by?(user, field=nil)
	  return true
    user.administrator? || user == owner || user.in?(members)
	end
  
end
