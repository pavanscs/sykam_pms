ActiveAdmin.register_page "Calendar" do
  content do
    para "Hello World"
  end
  action_item :show,
      if: proc{ current_admin_user.super? } do
        link_to "Find Admin", admin_admin_users_path, method: :get           
    end
end