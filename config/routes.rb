Rails.application.routes.draw do

  #管理者用
  namespace :admin do
    resources :users, only: [:show, :index]
    resources :tweets, only: [:index, :show]
    root 'homes#top'
  end

  # 会員用
  scope module: :public do
    root 'homes#top'
   resources :tweets, only: [:new, :index, :show, :edit, :create, :destroy, :update] do
    resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
   resources :users, only: [:index, :show, :edit, :update]
  end

# 会員用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin,skip: [:registrations, :passwords] ,controllers:  {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
