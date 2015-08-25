class StaticPagesController < ApplicationController
  def home
	@restaurants = Restaurant.all
	@restaurant_ranks = Restaurant.order("r_like DESC")
  end

  def about
  end

  def contact
  end

end
