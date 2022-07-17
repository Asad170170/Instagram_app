# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, only: [:index]
  resources :posts
  resources :comments, only: %i[destroy create]
  resource :stories

  get 'req_accept/:follower_id' => 'users#requests_accept', as: :requests_accept
  get 'req_decline/:follower_id' => 'users#requests_decline', as: :requests_decline
  get 'requests/:username' => 'users#requests', as: :requests_index
  get 'profile/:username' => 'users#profile', as: :profile
  get 'post/like/:post_id' => 'likes#save_like', as: :like_post
  post 'follow/user' => 'users#follow_user', as: :follow_user
  root to: 'public#homepage'

  get 'search', to: 'search#index'
end
