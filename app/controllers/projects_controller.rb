class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
  
  auto_actions_for :owner, [:new, :create]
  
  autocomplete :new_member_name do
    project = find_instance
    hobo_completions :name, User.without_project(project).is_not(project.owner)
  end
  
  
  def	show
    @project = find_instance
    @stories = 
      @project.stories.apply_scopes(:search    => [params[:search], :title],
                                    :status_is => params[:status],
                                    :order_by  => parse_sort_param(:title, :status))
  end

  # These actions are for integration testing
  show_action :show_with_controls do
    show
  end

  show_action :nested_has_many_test
  
end
