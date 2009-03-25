class StoriesController < ApplicationController

  hobo_model_controller

  auto_actions :show, :edit, :update, :destroy
  
  auto_actions_for :project, [:new, :create]

  show_action :formlet_test

  show_action :select_one_or_new_dialog_test

end
