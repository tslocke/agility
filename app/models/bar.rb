# this is a model that contains random crap for testing
class Bar < ActiveRecord::Base
  hobo_model

  fields do
    name :string
  end

  belongs_to :foo

  # --- Hobo Permissions --- #

  def create_permitted?
    acting_user.tester?
  end

  def update_permitted?
    acting_user.tester?
  end

  def destroy_permitted?
    acting_user.tester?
  end

  def view_permitted?(attribute)
    acting_user.tester?
  end  
end
