Rails.application.routes.draw do
  	devise_for :users, 
  		:controllers => { registrations: 'registrations'}
  		
	get 'welcome/login'
	get 'welcome/registration'	
	post 'welcome/create', as: :register_user
  	root 'welcome#index'
end
