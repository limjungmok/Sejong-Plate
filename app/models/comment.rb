class Comment < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :facebook_user
	
	validates :c_content, presence: true, length: {minimum: 1, maximum: 300 }

end
