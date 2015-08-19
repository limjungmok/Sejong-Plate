class Restaurant < ActiveRecord::Base
	has_many :albums
	has_many :comments
	accepts_nested_attributes_for :albums
	accepts_nested_attributes_for :comments
	validates :r_name, :presence => true
end
