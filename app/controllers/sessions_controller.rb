class SessionsController < Devise::SessionsController
	# after_action :verify_authorized, :except => :index, unless: :devise_controller?
	def after_sign_in_path_for(resource)
	  dashboard_index_path
	end
end