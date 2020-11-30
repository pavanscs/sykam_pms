class AddAlteralternativeQRcodeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :alternativeqrcode, :string
  end
end
