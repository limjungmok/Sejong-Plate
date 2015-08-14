class AddNicknameToFacebookUsers < ActiveRecord::Migration
  def change
    add_column :facebook_users, :nickname, :string
  end
end
