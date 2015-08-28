class AddRLatitudeRLongitudeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :r_latitude, :float
    add_column :restaurants, :r_longtitude, :float
  end
end
