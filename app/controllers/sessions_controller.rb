class SessionsController < Devise::SessionsController
	# after_action :verify_authorized, :except => :index, unless: :devise_controller?
	skip_after_action :verify_authorized, only: :index
	def after_sign_in_path_for(resource)
	  edit_user_registration_path
	end
end