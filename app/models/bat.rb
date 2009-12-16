class Bat < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  belongs_to :baz


  # --- Permissions --- #

  def create_permitted?
    acting_user.tester?
  end

  def update_permitted?
    acting_user.tester?
  end

  def destroy_permitted?
    acting_user.tester?
  end

  def view_permitted?(field)
    true
  end

end