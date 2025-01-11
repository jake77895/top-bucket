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
    resources :form_templates, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :settings, only: [:index, :update]
    resources :pages do
      member do
        # Routes for managing tier lists
        get :manage_tier_lists
        patch :update_tier_list_associations

        # Routes for managing employee views
        get :manage_employee_views
        patch :update_employee_associations
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
    resources :employees do
      collection do
        post :create_initial
        get :new_details
        get :edit_initial
        patch :update_initial
        get :edit_details
      end
      member do
        get :edit_initial
        patch :update_initial
        get :edit_details
      end
    end
    resources :employee_views do
      member do
        get 'manage_employees' # Display the interface to manage employees
        post 'add_employee'    # Add an employee to the view
        delete 'remove_employee' # Remove an employee from the view
      end
    end
    resources :companies
    resources :position_types
    resources :locations
    resources :schools
    resources :groups
    resources :job_levels do
      collection do
        get 'new_company'
        get 'new_global'
        get 'new_position_type'
      end
  
      member do
        get 'edit_company'
        get 'edit_global'
        get 'edit_position_type'
      end
    end
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

  # Public Routes for Viewing Employee Views
  resources :employee_views, only: [:show] do
    resources :employees, only: [] do
      resources :ratings, only: [:new, :create]
    end
  end


  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
