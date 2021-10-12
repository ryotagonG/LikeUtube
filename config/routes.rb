Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about" , as: "about"
  resources :users, only: [:show, :edit, :update]
  resources :articles, only: [:new, :create, :index, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
