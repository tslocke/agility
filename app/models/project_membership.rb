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
    require 'ruby-debug'
    debugger if project_id.nil?
    debugger if user_id.nil?
    true
  end
  

end
