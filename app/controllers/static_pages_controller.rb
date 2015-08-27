class StaticPagesController < ApplicationController
  def home
	@restaurants = Restaurant.paginate(page: params[:page], :per_page => 9 ).all
	@restaurant_ranks = Restaurant.order("r_like DESC")
	@random_restaurants = Restaurant.all.shuffle
  end

  def contact
  end

end
