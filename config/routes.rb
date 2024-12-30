Rails.application.routes.draw do
  devise_for :users

  # Namespaced Admin Section
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :settings, only: [:index, :update]
  end

  # Redirect invalid /users route to /users/sign_up
  get '/users', to: redirect('/users/sign_up')
  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
