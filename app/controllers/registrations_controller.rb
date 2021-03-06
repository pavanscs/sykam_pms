class RegistrationsController < Devise::RegistrationsController
	def new
  	 @user = User.new
     # @wallet = Wallet.new
  end

	def create
  	@user = User.new(user_params)
  	@user.organization_id = params[:user][:organization][:organization_id].to_i
  	if @user.save
      Wallet.create :user_id => @user.id
  		redirect_to new_user_session_path, notice: 'Successfull created, You will receive an email with instructions on Account Confirmable'
  	else
  		puts @user.errors.full_messages.inspect
  		render 'new'
  	end
	end

  def update_pic
    # @user = User.find(params[:id]) 
    # @user.save
    current_user.avatar = params[:user][:avatar]
    if current_user.save!
      redirect_to edit_user_registration_path, notice: 'Updated Successfull' 
    else
      render 'edit', alert: 'Update failed'
    end
  end

	def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation, :mobile, :date_of_birth, :gender, :organization_id)
  end

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation, :current_password, :name, :not_a_robot)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :not_a_robot)
  end
  private :sign_up_params
  private :account_update_params
    
end


