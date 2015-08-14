class SessionsController < ApplicationController

  def create
    user = FacebookUser.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to edit_facebook_user_path(:id => session[:user_id])
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
