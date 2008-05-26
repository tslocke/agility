class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :show, :edit, :update, :destroy, :new_story, :create_story
  
  def show
    @project = find_instance
    @project_stories = @project.stories.apply_scopes(:status_is => params[:status],
                                                     :search    => [params[:search], :title],
                                                     :order_by  => parse_sort_param(:title, :status))
  end
  
end
