class Tweet < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image

    #tweetの検索条件の指定
  def self.looks(search, word)
    if search == "perfect_match"
      @tweet = Tweet.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @tweet = Tweet.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @tweet = Tweet.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @tweet = Tweet.where("title LIKE?","%#{word}%")
    else
      @tweet = Tweet.all
    end
  end
  #ログイン中の会員がその投稿にいいねをしていいるかを判断
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
