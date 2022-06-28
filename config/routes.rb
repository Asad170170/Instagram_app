# frozen_string_literal: true

Rails.application.routes.draw do

 # get "/dashboard" => "accounts"
  devise_for :users , controllers: {
    sessions: 'users/sessions'
  }
  resources :users

  resources :posts,only: [:new, :create ,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "posts#index"
  root to: "public#homepage"

end
