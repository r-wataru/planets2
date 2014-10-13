Rails.application.routes.draw do
  root to: 'top#index'

  resources :users
  # ログイン・ログアウト
  resource :session, only: [ :new, :create, :destroy ]

  # FacebookでログインとScreenName作成
  resource :user_identity, only: [ :new, :create ] do
    post :confirm, on: :collection
  end

  get 'auth/facebook/callback', to: "sessions#callback"
  get "auth/failure", to: "sessions#failure"

  resources :results
  resources :games do
    resources :individual_results
    resources :pitcher_results
  end
  resources :schedules
end
