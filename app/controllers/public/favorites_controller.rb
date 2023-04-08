class Public::FavoritesController < ApplicationController

 def create
  @favorite = Favorite.new(user_id: current_user.id, tweet_id: params[:tweet_id])
  @favorite.save
  redirect_to tweet_path(params[:tweet_id])
 end

 def destroy
  @favorite = Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
  @favorite.destroy
  redirect_to tweet_path(params[:tweet_id]) 
 end
end
