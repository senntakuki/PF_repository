class Public::UsersController < ApplicationController
   before_action :ensure_correct_user, only: [:edit, :update]
   before_action :ensure_guest_user, only: [:edit]

   def show
      @user = User.find(params[:id])
      @tweets = @user.tweets
   end

   def index
      @users = User.all
   end

   def edit
      @user = User.find(params[:id])
   end

   def update
      @user = User.find(params[:id])
      @ser.update(user_params)
    if @user.save
      redirect_to public_user_path(@user.id)
    else
      render :edit
    end
   end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
