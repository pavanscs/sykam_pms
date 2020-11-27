ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  filter :role
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, :label => 'Role', :as => :select, :collection => AdminUser.roles.keys
    end
    f.actions
  end
  
  collection_action :employees, method: [:post, :get] do
    render 'employees'
  end

  action_item :show,
    if: proc{ current_admin_user.super? } do
      link_to "Find Employee", employees_admin_admin_users_path(role: 'employee'), method: :post
  end

  action_item :show,
    if: proc{ current_admin_user.super? } do
      link_to "Super Admins", employees_admin_admin_users_path(role: 'super'), method: :post 
  end

end

