# this is a model that contains random crap for testing
class Foo < ActiveRecord::Base
  hobo_model

  fields do
    timestamps
    i :integer
    f :float
    dec :decimal
    s :string
    tt :text
    d :date
    dt :datetime
    hh :html
    tl :textile
    md :markdown
    es enum_string("a", "b", "c"), :default => "a"
  end

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
