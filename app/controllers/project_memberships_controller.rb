class ProjectMembershipsController < ApplicationController

  hobo_model_controller

  auto_actions :create, :update, :destroy

end
