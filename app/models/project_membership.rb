class ProjectMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  
  belongs_to :project
  belongs_to :user


  # --- Hobo Permissions --- #

	def create_permitted?
	  acting_user.administrator? || acting_user == project.owner
  end

  def update_permitted?
	  acting_user.administrator? || acting_user == project.owner
  end

  def delete_permitted?
	  acting_user.administrator? || acting_user == project.owner
  end

	def view_permitted?(attribute=nil)
    true
	end
  

end
