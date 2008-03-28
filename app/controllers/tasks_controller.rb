class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :write_only, :edit

end
