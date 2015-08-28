class AddRecommendToFacebookUsers < ActiveRecord::Migration
  def change
    add_column :facebook_users, :recommend, :boolean, default: false
  end
end
