class RestaurantsController < ApplicationController
	#before_action :is_admin?, only: [:new, :create, :edit, :destroy]


	def show
		@restaurant = Restaurant.find(params[:id])
		@albums = @restaurant.albums.all
		#@comments = @restaurant.comments.all
		@share_img = Restaurant.find(params[:id]).albums[0].picture_url

		
		#if(params[:r_distance_door])
		#	@restaurants= Restaurant.where("r_distance_door = ?", params[:r_distance_door])				
		#	else
		#	@restaurants= Restaurant.order('id DESC')
		#end
	end

	def index			
		if(params[:r_distance_door])

			#@restaurants= Restaurant.where("r_distance_door = ?", params[:r_distance_door])				
			@restaurants= Restaurant.paginate(page: params[:page], :per_page => 6).where("r_distance_door = ?", params[:r_distance_door])
			else
			@restaurants= Restaurant.paginate(page: params[:page], :per_page => 6).order('id DESC')
		end
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@restaurant = Restaurant.new
		@album = @restaurant.albums.build
		@admin_info_user = FacebookUser.all
		@admin_info_comment = Comment.all
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
		redirect_to root_path
	end

	def is_admin?
		unless current_user.admin == true
			flash[:danger] = "잘못된 접근입니다"
			redirect_to root_path
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:r_name, :r_phone_number, :r_like, :r_distance_door, :r_distance, :r_time, :r_code, :r_latitude, :r_longtitude, albums_attributes: [:id, :restaurant_id, :picture])
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