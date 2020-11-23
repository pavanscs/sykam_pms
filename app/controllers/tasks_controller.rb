class TasksController < ApplicationController
  def new
  	@task = Task.new
  	@task = Task.all
  end

  def create
  	@project = Project.find(params[:project_id])
  	if @project.save
		@task = @project.tasks.create(task_params)
		redirect_to projects_show_path(project_id: @project.id), notice: 'Task created Successfull'
	else
		redirect_to projects_show_path(project_id: @project.id), alert: 'Task failed to create'
	end
  end

  def show
	@project = Project.find(params[:project_id])
	if @project.nil?
    	@task = Task.all
    	flash.now[:alert] = "Your task was not found"
    	render "new"
  	end
  end
  
  private
	def task_params
		params.permit(:task,:project_id)
	end

end
