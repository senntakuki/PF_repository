class  Public::TweetsController < ApplicationController

   before_action :correct_user, only: [:edit, :update]

  def new
    @tweet = Tweet.new
  end

  def create
     @tweet = Tweet.new(tweet_params)
     @tweet.user_id = current_user
   if @tweet.save
    redirect_to user_path(current_user.id)
    beybug
   else
    @tweets = Tweet.all
     render 'index'
   end
  end

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end


  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :post_comments)
  end
end
