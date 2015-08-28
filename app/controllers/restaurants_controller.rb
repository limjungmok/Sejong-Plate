class RestaurantsController < ApplicationController

	def show
		@restaurant = Restaurant.find(params[:id])
		@albums = @restaurant.albums.all
		@comments = @restaurant.comments.all
	end

	def index
      if logged_in? && current_user.nickname =="세종대학생"
      redirect_to edit_facebook_user_path(:id => current_user.id)
      end   
		
      @restaurants= Restaurant.paginate(page: params[:page], :per_page => 5 ).all
		@restaurant_ranks = Restaurant.order("r_like DESC")
	end

<<<<<<< HEAD
	def new
		@restaurant = Restaurant.new
		@album = @restaurant.albums.build
		@admin_info_user = FacebookUser.all
		@admin_info_comment = Comment.all
	end

<<<<<<< HEAD
=======
>>>>>>> ad740cf18af866ccf710eac5e55da4092cc38956
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
=======
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
>>>>>>> jy_x

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
		params.require(:restaurant).permit(:r_name, :r_phone_number, :r_like, :r_distance, :r_time, :r_code, :r_latitude, :r_longtitude, albums_attributes: [:id, :restaurant_id, :picture])
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