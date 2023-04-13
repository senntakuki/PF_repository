class Admin::TweetsController < ApplicationController
     before_action :authenticate_admin!

 def index
   @tweets = Tweet.all
 end

 def show
   @tweet = Tweet.find(params[:id])
   @comment = @tweet.post_comments
 end

 def destroy
   @user = User.find(params[:id])
   @tweet = Tweet.find(params[:id])
   @tweet.delete
    redirect_to admin_user_path(@user)
 end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :post_comments)
  end
end
