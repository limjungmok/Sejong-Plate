class Valuation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :facebook_user

	def set_recommend_valuation(bool)
		self.recommend = bool
	end
end
