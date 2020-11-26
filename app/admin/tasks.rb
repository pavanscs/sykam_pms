ActiveAdmin.register Task do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :task, :project_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:task, :project_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu :parent => "Projects Blog"
  def index
    authorize :tasks, :index?
  end
end
