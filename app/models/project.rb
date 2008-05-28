class Project < ActiveRecord::Base

  hobo_model

  fields do
    name :string
    timestamps
  end
  
  belongs_to :owner, :class_name => "User", :creator => true
  
  has_many :members, :through => :memberships, :source => :user, :managed => true
  has_many :memberships, :class_name => "ProjectMembership", :dependent => :destroy

  has_many :contributor_memberships, :class_name => "ProjectMembership", :scope => :contributor
  has_many :contributors, :through => :contributor_memberships, :source => :user

  has_many :stories, :dependent => :destroy
  
  def accepts_changes_from?(user)
    user.administrator? || user == owner || user.in?(contributors)
  end
  

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.signed_up? && owner == user
  end

  def updatable_by?(user, new)
    user.administrator? || (user == owner && same_fields?(new, :owner))
  end
  
  def deletable_by?(user)
    user.administrator? || user == owner
  end

  def viewable_by?(user, field=nil)
    user.administrator? || user == owner || user.in?(members)
  end

end
