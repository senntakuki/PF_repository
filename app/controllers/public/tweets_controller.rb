class  Public::TweetsController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_user, only: [:edit, :update, :destroy]

  def new
    @tweet = Tweet.new
  end

  def create
     @tweet = Tweet.new(tweet_params)
     @tweet.user_id = current_user.id
   if @tweet.save
    redirect_to user_path(current_user.id)
   else
    @tweets = Tweet.all
     render 'index'
   end
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @post_comments = @tweet.post_comments
    @post_comment = PostComment.new
    # @tweet_detail = Tweet.find(params[:id])
#   unless ViewCount.find_by(user_id: current_user.id, tweet_id: @tweet_detail.id)
#       current_user.view_counts.create(tweet_id: @tweet_detail.id)
#   end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
      @tweet = Tweet.find(params[:id])
   if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
   else
      render 'edit'
   end
  end

  def destroy
     @tweet = Tweet.find(params[:id])
     @tweet.destroy
     redirect_to user_path(current_user)
  end


  private

  def ensure_user
    @tweets = current_user.tweets
    @tweet = @tweets.find_by(id: params[:id])
    redirect_to tweet_path unless @tweet
  end

  def tweet_params
    params.require(:tweet).permit(:title, :body, :post_comments)
  end
end
