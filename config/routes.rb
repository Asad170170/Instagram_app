# frozen_string_literal: true

Rails.application.routes.draw do

 # get "/dashboard" => "users#index"
  get "profile/:username" => "users#profile", as: :profile
  get "post/like/:post_id" => "likes#save_like",as: :like_post
  post "follow/user" => "users#follow_user", as: :follow_user

  devise_for :users , controllers: {
    sessions: 'users/sessions'
  }
  resources :users ,only: [:index]
  resources :posts,only: [:new, :create ,:show]
  resources :comments,only: [:destroy, :create ]
  resource :stories

  root to: "public#homepage"

end
