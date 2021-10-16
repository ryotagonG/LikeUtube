Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "about" => "homes#about" , as: "about"
  get "search" => "articles#search"
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :articles, only: [:new, :create, :index, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
