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

		@check_user.save

		@test = @restaurant.valuations.where(:restaurant_id => @restaurant.id).where(:facebook_user_id => current_user.id)
		if @test
			if @test.first.recommend == true
				@test.first.set_recommend_valuation(false)
				@restaurant.decrement! :r_like
				@test.first.save

			elsif @test.first.recommend == false
				@test.first.set_recommend_valuation(true)
				@restaurant.increment! :r_like
				@test.first.save
			end
		else
			@test_new.recommend = true
			@restaurant.increment! :r_like
			@test_new.save
		end
	end
end
