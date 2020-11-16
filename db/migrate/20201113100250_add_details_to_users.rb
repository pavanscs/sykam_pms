class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :user_name, :text
    add_column :users, :mobile, :text
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :text
    add_reference :users, :organization, null: false, foreign_key: true
  end
end
