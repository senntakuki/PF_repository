# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

 def after_sign_in_path_for(resource)
    root_path
 end

 def after_sign_out_path_for(resource)
    root_path
 end

 # 退会しているかを判断するメソッド
 def user_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  @user = User.find_by(email: params[:user][:email])
  #byebug
  # アカウントを取得できなかった場合、このメソッドを終了する
  return if !@user
    # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    #＠userのactive_for_authentication?メソッドがfalseであるかどうか。
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
    # 退会できれば新規登録画面にリダイレクトする
    redirect_to new_user_registration_path
    end
 end

 #ゲストログイン用
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーでログインしました。'
  end

end
