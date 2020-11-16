class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
           devise_parameter_sanitizer.permit(:sign_up){ |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id)}

           devise_parameter_sanitizer.permit(:account_update){ |u| u.permit(:first_name, :last_name, :user_name, :email, :password, :mobile, :date_of_birth, :gender, :organization_id)}
      	end
end
