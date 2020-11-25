class WelcomeController < ApplicationController
  # before_action :authenticate_user!
  # skip_after_action :verify_authorized, only: :index
  def index
    # after_active WelcomeHelper

  end

  def login
  end
  
  def registration
  	@user = User.new
  end

  def create
  	puts params.inspect 
    	@user = User.new(user_params)
    	if @user.save
  		redirect_to @user, success: 'Comment created'
  	else
  		puts @user.errors.full_messages.inspect
  		render 'registration'
  	end
  end 

  private
	def user_params
		params.permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id )
	end
end

