class StaticPagesController < ApplicationController
  def home
	@restaurants = Restaurant.all
	@restaurant_ranks = Restaurant.order("r_like DESC")
	@random_restaurants = Restaurant.all.shuffle
  end

  def about
  end

  def contact
  end

end
