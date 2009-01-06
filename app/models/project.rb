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

  # --- Hobo Permissions --- #

  def create_permitted?
    acting_user == owner
  end

  def update_permitted?
    acting_user.administrator? || (acting_user == owner && !owner_changed?)
  end

  def delete_permitted?
    acting_user.administrator? || acting_user == owner
  end

	def view_permitted?(attribute=nil)
    acting_user.administrator? || acting_user == owner || acting_user.in?(members)
	end
  
end
