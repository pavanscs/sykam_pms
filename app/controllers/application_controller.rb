class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
	include Pundit

	# protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    

    protected

        def configure_permitted_parameters
           devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id)}

           devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id, :current_password)}
      	end

  	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	  def user_not_authorized
	    policy_name = exception.policy.class.to_s.underscore

	    flash[:error] = "You are not authorized to perform this action."#t {policy_name}.#{exception.query}", scope: "pundit", default: :default"
	    redirect_to root_path
	  end
end