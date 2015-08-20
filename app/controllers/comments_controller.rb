class CommentsController < ApplicationController
	def create
		@restaurant = Restaurant.find(params[:comment_id])
		@comment = @restaurant.comments.create(comment_params)

	end

	def edit
	end

	def update
	end

	def destroy
	end


	private

	def comment_params
		params.require(:comment).permit(:c_content)
	end
end
