Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts do
  	delete '/likes' => 'likes#destroy'
  	post '/likes' => 'likes#create'
  end
  resources :users, only: [:show, :edit, :update]
  resources :likes, only: [:index, :edit, :update]

  get '/post/post_tag/:name' => 'posts#post_tag'
  get '/post/post_tag' => 'posts#post_tag'

  get '/like/like_tag/:name' => 'likes#like_tag'
  get '/like/like_tag' => 'likes#like_tag'

end