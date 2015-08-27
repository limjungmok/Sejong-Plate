class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
		@albums = @restaurant.albums.all
		@comments = @restaurant.comments.all
	end

	def like
		@restaurant = Restaurant.find(params[:id])
		@restaurant.increment! :r_like
	end

	def unlike
		@restaurant = Restaurant.find(params[:id])
		@restaurant.decrement! :r_like
	end

	def index
		@restaurants= Restaurant.paginate(page: params[:page], :per_page => 5 ).all
		@restaurant_ranks = Restaurant.order("r_like DESC")
	end

	def new
		@restaurant = Restaurant.new
		@album = @restaurant.albums.build
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		respond_to do |format|
			if @restaurant.save
				unless params[:albums].nil?
					save_attachments
				end
				format.html { redirect_to @restaurant, notice: '등록 완료!'}
			else
				format.html { render action: 'new'}
			end
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		@albums = @restaurant.albums.all
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		respond_to do |format|
			if @restaurant.update_attributes(restaurant_params)
				update_attachments if params[:albums]
				format.html { redirect_to restaurants_path, notice: '수정 완료!'}
			else
				format.html { render action: 'edit'}
			end
		end
	end

	def destroy
		Restaurant.find(params[:id]).destroy
		flash[:success] = "삭제 완료!"
		redirect_to restaurants_path
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:r_name, :r_phone_number, :r_like, :r_distance, :r_time, :r_code, albums_attributes: [:id, :restaurant_id, :picture])
		end

		def save_attachments
			params[:albums]['picture'].each do |p|
				@album = @restaurant.albums.create!(:picture => p)
			end
		end

		def update_attachments
			@restaurant.albums.each(&:destroy) if @restaurant.albums.present?
			params[:albums]['picture'].each do |p|
				@album = @restaurant.albums.create!(:picture => p)
			end
		end
end
