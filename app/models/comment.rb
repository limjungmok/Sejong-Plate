class Comment < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :facebook_user
end
