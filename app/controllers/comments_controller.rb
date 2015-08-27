class CommentsController < ApplicationController
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.create(comment_params)
		@comment.facebook_user_id = current_user.id
		@comment.facebook_user_nickname = current_user.nickname

		if @comment.save
			respond_to do |format|
				format.js
				format.html{ redirect_to @restaurant }
			end
		else
			flash[:danger] = "글을 제대로 쓰세요"
			redirect_to @restaurant
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find_by(:id => params[:id])
		@comment.c_content = nil
	end

	def update
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find_by(:id => params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to @restaurant
		else
			redirect_to root_path
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@restaurant.comments.find_by(:id => params[:id]).destroy
		redirect_to @restaurant
		
	end


	private

	def comment_params
		params.require(:comment).permit(:facebook_user_nickname, :c_content)
	end
end
