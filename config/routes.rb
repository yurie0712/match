Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :users, only: [:show, :edit, :update]

  get '/post/post_tag/:name' => 'posts#post_tag'
  get '/post/post_tag' => 'posts#post_tag'
end