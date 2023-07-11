class Public::SearchesController < ApplicationController
      before_action :authenticate_user!

      def search
          @range = params[:range]
          #検索結果がuserの場合
       if @range == "投稿者"
          @users = User.looks(params[:search], params[:word])
          #検索結果がtweetの場合
       else
          @tweets = Tweet.looks(params[:search], params[:word])
       end

      end

end
