Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts, shallow: true do
  	resource :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get '/likes' => 'likes#index'

  get '/post/post_tag/:name' => 'posts#post_tag'
  get '/post/post_tag' => 'posts#post_tag'

end