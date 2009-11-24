class ProjectMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    contributor :boolean, :default => false
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
                                  
  def destroy_permitted?           
    acting_user.administrator? || project.owner_is?(acting_user)
  end

  def view_permitted?(attribute=nil)
    raise "bug468" if project_id.nil?
    raise "bug468" if user_id.nil?
    true
  end
  

end
