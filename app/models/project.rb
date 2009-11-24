class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :required
    timestamps
  end
  
  has_many :stories, :dependent => :destroy
  
  belongs_to :owner, :class_name => "User", :creator => true
  
  has_many :memberships, :class_name => "ProjectMembership", :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user

   has_many :contributor_memberships, :class_name => "ProjectMembership", :scope => :contributor
   has_many :contributors, :through => :contributor_memberships, :source => :user
 
   # permission helper
   def accepts_changes_from?(user)
     user.administrator? || user == owner || user.in?(contributors)
   end
   
  
  # --- Hobo Permissions --- #

  def create_permitted?
    owner_is? acting_user
  end

  def update_permitted?
    accepts_changes_from?(acting_user) && !owner_changed?
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end
  
  def view_permitted?(attribute=nil)
    raise "bug468" if owner_id.nil?
    acting_user.administrator? || owner_is?(acting_user) || acting_user.in?(members)
  end
  
end
