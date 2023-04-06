class TweetsController < ApplicationController
  
   before_action :correct_user, only: [:edit, :update]

  def new
    @tweet = Tweet.new
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
    params.require(:tweet).permit(:title, :body)
  end
end
