class AddInfoToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :r_distance, :string
    add_column :restaurants, :r_time, :string
    add_column :restaurants, :r_code, :string
  end
end
