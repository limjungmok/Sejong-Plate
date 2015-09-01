class StaticPagesController < ApplicationController
  def home
  	if logged_in? && current_user.nickname =="세종대학생"
  		redirect_to edit_facebook_user_path(:id => current_user.id)
  	end

  	@restaurants = Restaurant.reorder("created_at DESC").paginate(page: params[:page], :per_page => 9).all
  	@restaurant_ranks = Restaurant.order("r_like DESC")
  	@random_restaurants = Restaurant.all.shuffle

  end

  def contact
  end

end
