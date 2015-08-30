class AddRDistanceDoorToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :r_distance_door, :string
  end
end
