class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :restaurant_id
      t.string :r_photo

      t.timestamps null: false
    end
  end
end
