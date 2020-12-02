class ProjectsController < ApplicationController
  def new
    @project = Project.all
  end

  def create 
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_new_path, notice: 'Project created Successfull'
    else
      redirect_to projects_new_path, alert: 'Project failed to create'
    end
  end

  def show
    @project = current_user.projects.find(params[:project_id])
    if @project.nil?
        @project = Project.all
        flash.now[:alert] = "Project not found"
        render "new"
      end
  end

  def update
    # @project = current_user.projects.find(params[:project_id])
    project = Project.find(params[:project_id])
    authorize project
    if project.update(project_params)
      redirect_to project
    else
      render :edit
    end
  end

  def project_params
  	params.permit(:title,:projectProject)
  end
end