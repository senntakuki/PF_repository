class Public::PostsController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end


   private

  def post_params
    params.require(:post).permit(:title, :body, :post_comment)
  end
end
