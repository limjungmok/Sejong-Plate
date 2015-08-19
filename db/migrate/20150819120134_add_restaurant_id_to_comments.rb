class AddRestaurantIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :restaurant_id, :integer
  end
end
