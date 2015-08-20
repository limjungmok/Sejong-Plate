class CommentsController < ApplicationController
	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@comment = @restaurant.comments.create(comment_params)
		if @comment.save
			redirect_to :back
		else
			redirect_to root_path
		end
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
