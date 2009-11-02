# this is a model that contains random crap for testing
class Foo < ActiveRecord::Base
  hobo_model

  fields do
    timestamps
    bool1 :boolean
    bool2 :boolean
    i :integer
    f :float
    dec :decimal, :precision => 10, :scale => 4
    s :string
    tt :text, :limit => 16777215
    d :date
    dt :datetime
    hh :html
    tl :textile
    md :markdown
    es enum_string("a", "b", "c"), :default => "a"
  end

  has_many :bars, :accessible => true

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
