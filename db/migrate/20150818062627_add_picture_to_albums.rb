class AddPictureToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :picture, :string
  end
end
