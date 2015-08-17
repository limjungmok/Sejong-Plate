class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def new_store
  	@restaurant = Restaurant.new
  end
end
