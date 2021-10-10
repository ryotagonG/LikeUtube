Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about" , as: "about"
  resources :articles
  resources :comments, only: [:create, :index, :destroy]
  
  resources :users, only: [:show]
end
