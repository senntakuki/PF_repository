class Public::HomesController < ApplicationController

  def top
    # 投稿のいいね数ランキング。
    #Favorite.group(:tweet_id)favoritesモデルのtweet_idと同じものをまとめる。
    #order('count(tweet_id) desc')まとめたものを多い順に並び替える。
    #pluck(:tweet_id)そのままだとfavoriteモデルで取り出してしまうのでtweet_idで値を取り出す。
    @favorite_ranks = Tweet.find(Favorite.group(:tweet_id).order('count(tweet_id) desc').limit(3).pluck(:tweet_id))

    #ユーザーのフォロワー数ランキング。
    @followers_ranks = User.find(Relationship.group(:followed_id).order('count(followed_id) desc').limit(3).pluck(:followed_id))

  end



end
