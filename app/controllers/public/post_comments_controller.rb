class Public::PostCommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_user, only: [:edit, :update, :destroy]

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.tweet_id = @tweet.id
    @comment.save
    @post_comment = PostComment.new
    redirect_to request.referer
  end

  def destroy
     @tweet = Tweet.find_by(params[:id])
     PostComment.find(params[:id]).destroy
     @post_comment = PostComment.new
     redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :profile_image)
  end
end
