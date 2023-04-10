class Admin::UsersController < ApplicationController
     

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:id])
    @tweets = @user.tweets
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_deleted)
  end
end
