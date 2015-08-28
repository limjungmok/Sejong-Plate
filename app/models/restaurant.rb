class Restaurant < ActiveRecord::Base
	has_many :albums, 	dependent: :destroy
	has_many :comments,	dependent: :destroy
	has_many :valuations, dependent: :destroy
	
	accepts_nested_attributes_for :albums
	accepts_nested_attributes_for :comments
	validates :r_name, presence: true
	validates :r_like, presence: true
end
