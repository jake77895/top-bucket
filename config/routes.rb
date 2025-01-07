Rails.application.routes.draw do

  get 'pages/index'
  get 'pages/show'
  devise_for :users

  # Namespaced Admin Section
  namespace :admin do
    get 'item_ranks/index'
    get 'item_ranks/new'
    get 'item_ranks/create'
    get 'item_ranks/edit'
    get 'item_ranks/update'
    get 'item_ranks/destroy'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/destroy'
    get 'tier_lists/index'
    get 'tier_lists/new'
    get 'tier_lists/edit'
    get 'tier_lists/show'
    get 'dashboard', to: 'dashboard#index'
    resources :users, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
    resources :settings, only: [:index, :update]
    resources :pages do
      member do
        get :manage_tier_lists
        patch :update_tier_list_associations
      end
    end
    resources :tier_list_templates
    resources :tier_lists do
      member do
        get 'add_items'
        post 'associate_items'
        patch :publish
      end
      resources :item_ranks, only: [:index, :edit, :update, :destroy]
    end
    resources :items
    resources :employees
    resources :companies
    resources :position_types
    resources :locations
  end

  # Redirect invalid /users route to /users/sign_up
  get '/users', to: redirect('/users/sign_up')

  # Public Routes for Viewing Pages
  resources :pages, only: [:index], path: 'pages'
  get '/pages/:slug', to: 'pages#show', as: 'page'

  # Public Routes for Viewing Individual TierLists
  resources :tier_lists, only: [:show] do
    member do
      get :user_rankings
      get :group, to: 'tier_lists#show_group'
    end
  end
  post 'rank_item', to: 'tier_lists#rank_item', as: :rank_item

  # Public post routes for creating and destroying comments
  resources :comments, only: [:create, :destroy]

  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
