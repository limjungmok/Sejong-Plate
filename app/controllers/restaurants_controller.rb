class RestaurantsController < ApplicationController
	def show
		@restaurant = Restaurant.find(params[:id])
		@albums = @restaurant.albums.all
	end

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
		@album = @restaurant.albums.build
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		respond_to do |format|
			if @restaurant.save
				params[:albums]['picture'].each do |a|
					@album = @restaurant.albums.create!(:picture => a)
				end
				format.html { redirect_to @restaurant, notice: '등록 완료!'}
			else
				format.html { render action: 'new'}
			end
		end
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:r_name, :r_phone_number, :r_click_count, :r_like, :r_distance, :r_time, :r_code, albums_attributes: [:id, :restaurant_id, :picture])
		end
end
