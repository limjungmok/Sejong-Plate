class CommentsController < ApplicationController
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.create(comment_params)
		if @comment.save
			respond_to do |format|
				format.js
				format.html{ redirect_to @restaurant }
			end
		else
			redirect_to root_path
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find_by(restaurant_id: @restaurant.id)
	end

	def update
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find_by(restaurant_id: @restaurant.id)
		if @comment.update_attributes(comment_params)
			redirect_to @restaurant
		else
			redirect_to root_path
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.find_by(restaurant_id: @restaurant.id).destroy

		respond_to do |format|
				format.js
				format.html{ redirect_to @restaurant }
		end
	end


	private

	def comment_params
		params.require(:comment).permit(:c_content)
	end
end
