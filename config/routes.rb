Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/show'
  devise_for :users

  # Namespaced Admin Section
  namespace :admin do
    get 'tier_lists/index'
    get 'tier_lists/new'
    get 'tier_lists/edit'
    get 'tier_lists/show'
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :settings, only: [:index, :update]
    resources :pages
    resources :tier_list_templates
    resources :tier_lists
  end

  # Redirect invalid /users route to /users/sign_up
  get '/users', to: redirect('/users/sign_up')

  # Public Routes for Viewing Pages
  resources :pages, only: [:index], path: 'pages'
  get '/pages/:slug', to: 'pages#show', as: 'page'

  # Public Routes for Viewing Individual TierLists
  resources :tier_lists, only: [:show]
  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
