# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#home"

  get "/", to: "pages#home"
  get "home", to: "pages#home"
  get "about", to: "pages#about"
  get "sitemap", to: "pages#sitemap"

  # Using a namespace:
  #
  #     Prefix Verb   URI Pattern                Controller#Action
  # admin_users GET    /admin/users(.:format)     admin/users#index
  #             POST   /admin/users(.:format)     admin/users#create
  # admin_user  GET    /admin/users/:id(.:format) admin/users#show
  #             PATCH  /admin/users/:id(.:format) admin/users#update
  #             PUT    /admin/users/:id(.:format) admin/users#update
  #             DELETE /admin/users/:id(.:format) admin/users#destroy

  # For enabling only some of the REST routes for articles (list them)
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update]

  # For enabling all REST routes for articles
  # resources :articles

  namespace :blog do
    resources :articles
    resources :categories, except: [:destroy]
  end

  namespace :chat do 
    get "/", to: 'chatroom#index'
    post 'message', to: 'messages#create'
  end

  # Websocket, for the Chat app
  mount ActionCable.server, at: '/cable'

  namespace :stock do 
    get "/", to: 'welcome#index'
  end

  get "signup", to: "users#new" # Signup form
  # post 'users', to: 'users#create'
  resources :users, except: [:new]

  # Login, logout don't hit DB, won't be REST resources
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
