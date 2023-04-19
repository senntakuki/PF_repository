class Public::FavoritesController < ApplicationController

 def create
  @tweet = Tweet.find(params[:tweet_id])
  @favorite = current_user.favorites.new(tweet_id: @tweet.id )
  @favorite.save
  redirect_to tweet_path(params[:tweet_id])
 end

 def destroy
  @tweet = Tweet.find(params[:tweet_id])
  @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
  @favorite.destroy
  redirect_to tweet_path(params[:tweet_id])
 end
#いいね一覧
 def favorites
    user = User.find(params[:user_id])
    @favorite_tweets = user.favorites
 end

end
