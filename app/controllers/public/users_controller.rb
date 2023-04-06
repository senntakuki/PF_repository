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

    def is_deleted
        @user = current_user
     if @user.update(is_deleted: true)
   　　 sign_out_and_redirect(current_customer)
     else
  　　　  render "unsubscribe"
     end
    end

    def withdraw
        @user = current_user
     if @user.update(is_deleted: true)
       sign_out_and_redirect(current_user)
     else
       render "unsubscribe"
     end
    end

   end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :is_deleted)
  end


end
