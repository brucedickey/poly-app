# frozen_string_literal: true

Rails.application.routes.draw do

  root "pages#home"

  get "/", to: "pages#home"
  get "home", to: "pages#home"
  get "about", to: "pages#about"

  namespace :blog do
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
    resources :articles

    resources :categories, except: [:destroy]
  end

  get "signup", to: "users#new" # Signup form
  # post 'users', to: 'users#create'
  resources :users, except: [:new]

  # Login, logout don't hit DB, won't be REST resources
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

end
