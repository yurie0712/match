Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  resources :posts do
  	delete '/likes' => 'likes#destroy'
  	post '/likes' => 'likes#create'
    get :search, on: :collection
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
    put "/users/:id/hide" => "users#hide", as: 'users_hide'
  end
  resources :likes, only: [:index, :edit, :update]
  resources :bookmarks

  get '/post/post_tag/:name' => 'posts#post_tag'
  get '/post/post_tag' => 'posts#post_tag'

  get '/like/like_tag/:name' => 'likes#like_tag'
  get '/like/like_tag' => 'likes#like_tag'

  get '/bookmark/bookmark_tag/:name' => 'bookmarks#bookmark_tag'
  get '/bookmark/bookmark_tag' => 'bookmarks#bookmark_tag'

  resources :relationships, only: [:create, :destroy]

end