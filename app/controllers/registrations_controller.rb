class RegistrationsController < Devise::RegistrationsController
	def new
  	 @user = User.new
  end
	def create
    	@user = User.new(user_params)
    	@user.organization_id = params[:user][:organization][:organization_id].to_i
    	if @user.save
	  		redirect_to new_user_session_path, notice: 'Successfull created'
	  	else
	  		puts @user.errors.full_messages.inspect
	  		render 'new'
	  	end
  	end

  	def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id)
    end
end


