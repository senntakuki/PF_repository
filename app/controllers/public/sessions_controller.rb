# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

 def after_sign_in_path_for(resource)
    root_path
 end

 def after_sign_out_path_for(resource)
    root_path
 end

 # 退会しているかを判断するメソッド
 def user_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @user = User.find_by(email: params[:user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  if @user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #＠userのactive_for_authentication?メソッドがfalseであるかどうか。
  if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
  ## 【処理内容3】
  redirect_to new_user_registration_path
  end
  end
 end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
