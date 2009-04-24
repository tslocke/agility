class User < ActiveRecord::Base

  hobo_user_model # Don't put anything above this

  fields do
    name :string, :unique
    email_address :email_address, :unique, :login => true
    administrator :boolean, :default => false
    tester :boolean, :default => false
    timestamps
  end

  # This gives admin rights to the first sign-up.
  # Just remove it if you don't want that
  before_create { |user| user.administrator = true if count == 0 }
  
  has_many :task_assignments, :dependent => :destroy
  has_many :tasks, :through => :task_assignments
  
  has_many :projects, :foreign_key => "owner_id"

	has_many :project_memberships, :dependent => :destroy
  has_many :joined_projects, :through => :project_memberships, :source => :project

  
  # --- Signup lifecycle --- #

  lifecycle do 
    state :active, :default => true

    create :signup, :available_to => "Guest",
           :params => [:name, :email_address, :password, :password_confirmation],
           :become => :active

    transition :request_password_reset, { :active => :active }, :new_key => true do
      UserMailer.deliver_forgot_password(self, lifecycle.key)
    end

    transition :reset_password, { :active => :active }, :available_to => :key_holder,
               :update => [ :password, :password_confirmation ]
  
  end
  
  # --- Hobo Permissions --- #

  def create_permitted?
    false
  end

  def update_permitted?
    acting_user.administrator? || (acting_user == self && only_changed?(:crypted_password, :email_address))
    # Note: crypted_password has attr_protected so although it is permitted to change, it cannot be changed
    # directly from a form submission.
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
