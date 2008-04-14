class StoriesController < ApplicationController

  hobo_model_controller

  auto_actions :write_only, :show, :new, :edit

end
