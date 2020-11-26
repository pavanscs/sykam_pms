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
  
  # member_action :employee, method: 'get' do
    
  # end 

  collection_action :employees, method: :post do
    render 'employees'
  end

  # controller do
  #   # defaults :finder => :roles
  #   index do 
  #     column :role
  # end

  action_item :show,
      if: proc{ current_admin_user.super? } do
        link_to "Find Employee", employees_admin_admin_users_path(current_admin_user.id), method: :post           
    end

  # content title: 'A page' do
  #   columns do
  #     column do
  #       render partial: 'index'
  #     end
  #   end
  # end # content
  # action_item :find do
  #   link_to "Find Employee", admin_admin_users_much_action_path, method: :get
  # end

  # # action_item do
  # #   link_to('Perform', 'such_page/much_action')
  # # end
  # page_action :much_action do
  #   puts 'Wow, actually doing!'
  #   # redirect_to 'http://stackoverflow.com'
  # end
  # controller do
  #     def much_action
  #       puts 'Wow, actually doing!'
  #       redirect_to 'http://stackoverflow.com'
  #     end
  # end

  # action_item :add do
  #   link_to "Add Event", admin_admin_users_path, method: :get
  # end
  # menu :parent => "Users Blog"
  # action_item only: :show do
  #   # link_to('New Attachement Byme', new_resource_path)
  #     link_to 'if Attachement', 
  #         index :as => :block do |product|
  #           div :for => product do
  #             h2 auto_link(product.role)
  #             div do
  #               simple_format product.email
  #             end
  #           end
  #         end
  # end

  # action_item :view, only: :edit do
  #   link_to 'View on site', new_resource_path 
  # end
  # actions :all, except: [:update, :destroy] if @current_admin_user.super? 
  
  # collection_action :import_csv, method: :post do
  #   action_item :show,
  #               if: proc{ current_admin_user.super? } do
  #     "Only display this to super admins on the show screen"
  #   end
  #   # Do some CSV importing work here...
  #   redirect_to collection_path, notice: "CSV imported successfully!"
  # end

  # action_item :show do
  #   link_to 'view on site', new_resource_path
  # end

  # show do
  #   panel "Table of Contents" do
  #     table_for AdminUser.roles do
  #       column :role
  #       column :email
  #       column :created_at
  #     end
  #   end
  #   active_admin_comments
  # end
end

