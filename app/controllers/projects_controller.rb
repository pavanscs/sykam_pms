class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create 
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_new_path, notice: 'Project created Successfull'
    else
      redirect_to projects_new_path, alert: 'Project failed to create'
    end
  end

  def project_params
  	params.permit(:title,:project_type,:user_id)
  end

end