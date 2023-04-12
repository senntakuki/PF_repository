class  Public::TweetsController < ApplicationController
   before_action :current_user, only: [:edit, :update]

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
     @user = User.find(params[:id])
     @tweet = Tweet.find(params[:id])
     @tweet.delete
     redirect_to user_path(@user)
  end


  private

  def tweet_params
    params.require(:tweet).permit(:title, :body, :post_comments)
  end
end
