class SessionsController < ApplicationController

  def create
    user = FacebookUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if user.nickname == nil
    	redirect_to edit_facebook_user_path(:id => session[:user_id])
    else
    	redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
