Rails.application.routes.draw do
  get 'attachements/index'
  get 'attachements/new'
  # get 'attachements/new'
  get 'tasks/new'
  get 'projects/new'
  get 'projects/show'
  get 'tasks/index'
  # get '/projects/:id(.:format)', to: 'projects#new'
  devise_for :users, 
  	:controllers => {:registrations => "registrations", :sessions => "sessions"}

  post 'projects/create'
  post 'tasks/create'
  post 'attachements/create'

  get 'welcome/login'
  get 'welcome/registration'	
  post 'welcome/create', as: :register_user
  root 'welcome#index'
end


 # get 'users/:user_id/projects(.:format)'