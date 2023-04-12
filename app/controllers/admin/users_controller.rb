class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.find(params[:id])
    @tweets = @user.tweets
    @comment = @tweet.post_comments
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_deleted)
  end
end
