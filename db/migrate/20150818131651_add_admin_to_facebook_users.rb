class AddAdminToFacebookUsers < ActiveRecord::Migration
  def change
    add_column :facebook_users, :admin, :boolean, default: false
  end
end
