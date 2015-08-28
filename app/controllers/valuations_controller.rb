class ValuationsController < ApplicationController

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@check_user = @restaurant.valuations.find_by(:facebook_user_id => current_user.id)
		
		if @check_user.recommend == false
			@check_user.set_recommend_valuation(true)
      		@restaurant.increment! :r_like
		elsif @check_user.recommend == true
			@check_user.set_recommend_valuation(false)
			@restaurant.decrement! :r_like
		end
		@check_user.save0

	end

end
