class CreateValuations < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
      t.integer :facebook_user_id
      t.integer :restaurant_id
      t.boolean :recommend

      t.timestamps null: false
    end
  end
end
