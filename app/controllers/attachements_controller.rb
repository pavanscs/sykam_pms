class AttachementsController < ApplicationController
  	def index
		@attachements = Attachement.order('created_at')
	end

	def new
		@attachement = Attachement.new
	end

  	def create
  		@project = Project.find(params[:project_id])
  		if @project.save
			@attachement = @project.attachements.create(attachement_params)
			redirect_to projects_show_path(project_id: @project.id), notice: 'File Attached Successfull'
		else
			redirect_to projects_show_path(project_id: @project.id), alert: 'File failed to Attach'
		end
  	end 

  	def destroy
  		@project = Project.find(params[:project_id])
		@attachement = @project.attachements.find(params[:id])
	    if @attachement.destroy
	      redirect_to projects_show_path(project_id: @project.id), notice: 'Successfully deleted photo!'
	    else
	      redirect_to projects_show_path(project_id: @project.id), alert: 'File failed to Attach'
	    end
	end

	private
		def attachement_params
			params.permit(:project_id, :image)
		end
end