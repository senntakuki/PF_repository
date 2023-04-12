class Admin::TweetController < ApplicationController


 def index
   @tweets = Tweet.all
 end

 def show
   @user = User.find(params[:id])
   @tweet = @user.tweet

 end
end
