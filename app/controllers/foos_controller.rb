class FoosController < ApplicationController

  hobo_model_controller

  auto_actions :all

  show_action :show_editors
end
