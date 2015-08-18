
class Album < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	belongs_to :restaurant
end
