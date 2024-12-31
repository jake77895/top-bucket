Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/show'
  devise_for :users

  # Namespaced Admin Section
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :settings, only: [:index, :update]
    resources :pages
  end

  # Redirect invalid /users route to /users/sign_up
  get '/users', to: redirect('/users/sign_up')

  # Public Routes for Viewing Pages
  resources :pages, only: [:index], path: 'pages'
  get '/pages/:slug', to: 'pages#show', as: 'page'
  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
