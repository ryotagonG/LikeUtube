Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
  get 'search' => 'articles#search'
  resources :users, only: %i[index show edit update] do
    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :articles, only: %i[new create index show destroy] do
    resources :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
end
