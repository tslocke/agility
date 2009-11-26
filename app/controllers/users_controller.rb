class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :create ]

  def do_signup
    hobo_do_signup do
      if this.errors.blank?
        flash[:notice] << "You must activate your account before you can log in.  Please check your email."
        
        # FIXME: remove these two lines after you get email working reliably
        # and before your application leaves its sandbox...
        secret_path = user_activate_path :id=>this.id, :key => this.lifecycle.key
        flash[:notice] << "The 'secret' link that was just emailed was: <a id='activation-link' href='#{secret_path}'>#{secret_path}</a>."
      end
    end
  end
  
end
