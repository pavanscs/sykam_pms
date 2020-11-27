ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :user_name, :mobile, :date_of_birth, :gender, :organization_id, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :failed_attempts, :locked_at, :unlock_token, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :user_name, :mobile, :date_of_birth, :gender, :organization_id, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :failed_attempts, :locked_at, :unlock_token, :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  collection_action :usersinfo, method: [:post, :get] do
    render 'usersinfo'
  end

  controller do
    def usersinfo
      @user = User.all
    end
  end

  action_item :show,
    if: proc{ current_admin_user.super? } do
      link_to "Users Info", usersinfo_admin_users_path, method: :post
  end

end
