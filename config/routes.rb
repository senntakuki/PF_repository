Rails.application.routes.draw do

  # 会員用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
   # 管理者用
  devise_for :admin,skip: [:registrations, :passwords] ,controllers:  {
  sessions: "admin/sessions"
  }

  #管理者用
  namespace :admin do
    resources :users, only: [:show]
    resources :tweets, only: [:index, :show, :destroy]
    resources :post_comments, only: [:create, :destroy]
    root 'homes#top'
  end

  # 会員用
  scope module: :public do
    root 'homes#top'
   resources :tweets, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
   resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]

    end

   resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get 'favorites' => 'favorites#favorites', as: 'favorites'
     end
     get 'unsubscribe' =>'users#unsubscribe' # 退会確認画面
     patch 'remove' => 'users#remove' # 論理削除用のルーティング
     get "search" => "searches#search"  #検索機能用
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
