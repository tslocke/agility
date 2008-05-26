class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :edit, :update, :destroy

end
