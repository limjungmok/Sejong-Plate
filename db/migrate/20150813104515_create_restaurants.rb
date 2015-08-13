class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :r_name
      t.string :r_phone_number
      t.integer :r_click_count, default: "0"
      t.integer :r_like, default: "0"

      t.timestamps null: false
    end
  end
end
