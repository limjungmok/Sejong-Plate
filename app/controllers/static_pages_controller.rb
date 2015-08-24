class StaticPagesController < ApplicationController
  def home
	@restaurants = Restaurant.all
  end

  def about
  end

  def contact
  end

end
