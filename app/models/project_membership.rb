class ProjectMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end
  
  belongs_to :project
  belongs_to :user


  # --- Hobo Permissions --- #

  def create_permitted?
    acting_user.administrator? || project.owner_is?(acting_user)
  end                             
                                  
  def update_permitted?           
    acting_user.administrator? || project.owner_is?(acting_user)
  end                             
                                  
  def delete_permitted?           
    acting_user.administrator? || project.owner_is?(acting_user)
  end

  def view_permitted?(attribute=nil)
    true
  end
  

end
