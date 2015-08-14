class FacebookUsersController < ApplicationController

  def edit
  	@f_user = FacebookUser.find(params[:id])
  end

  def update
  	@f_user = FacebookUser.find(params[:id])
  	if params[:facebook_user][:nickname] == ""
  		flash[:danger] = "제대로 입력하세요"
  		redirect_to :back
  	else
  		@f_user.update_attributes(facebook_user_params)
  		redirect_to root_path
  	end
  end

  private
	  def facebook_user_params
	  	params.require(:facebook_user).permit(:nickname)
	  end
end
