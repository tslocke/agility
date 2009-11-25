class UsersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :create ]

  def do_signup
    hobo_do_signup do
      if this.errors.blank?
        secret_path = user_activate_path :id=>this.id, :key => this.lifecycle.key
        # FIXME: remove this line after you get email working reliably
        # and before your application leaves its sandbox...
        flash[:notice] << "The 'secret' link that was just emailed was: <a id='activation-link' href='#{secret_path}'>#{secret_path}</a>."
      end
    end
  end
  
end
