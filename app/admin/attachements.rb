ActiveAdmin.register Attachement do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :project_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:project_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu :parent => "Projects Blog"
  # if @current_user.admin?
  # action_item only: :edit do
  #   # link_to('New Attachement Byme', new_resource_path)
  #   if AdminUser.roles == ""
  #     link_to 'if Attachement', new_resource_path
  #   else
  #     # AdminUser.roles.inspect
  #     link_to 'else Attachement', new_resource_path
  #   end
  # end
  # end

  # index do
  #   column :image_file_name
  # end
  
end
