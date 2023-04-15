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
   @tweet = Tweet.find(params[:id])
   @tweet.destroy
    redirect_to admin_tweets_path
 end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :post_comments)
  end
end
