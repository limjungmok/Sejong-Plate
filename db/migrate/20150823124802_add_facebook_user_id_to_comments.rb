class AddFacebookUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :facebook_user_id, :integer
  end
end
