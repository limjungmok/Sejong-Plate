class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :c_content
      t.integer :c_like, default: 0
      t.integer :c_facebook_id

      t.timestamps null: false
    end
  end
end
