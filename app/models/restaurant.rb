class Restaurant < ActiveRecord::Base
	has_many :albums
	accepts_nested_attributes_for :albums
	validates :r_name, :presence => true
end
