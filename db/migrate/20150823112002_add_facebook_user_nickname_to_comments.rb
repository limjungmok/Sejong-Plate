class AddFacebookUserNicknameToComments < ActiveRecord::Migration
  def change
    add_column :comments, :facebook_user_nickname, :string
  end
end
