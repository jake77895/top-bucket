Rails.application.routes.draw do
  get 'interview_questions/index'
  get 'interview_questions/show'

  get 'pages/index'
  get 'pages/show'
  devise_for :users

  ########################
  ####  ADMIN ROUTES  ####
  ########################
  # Namespaced Admin Section
  namespace :admin do
    get 'question_packets/index'
    get 'question_packets/new'
    get 'question_packets/edit'
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
    resources :ratings, only: [:index, :destroy]
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
        
        # For the flagged flow
        get :flagged
      end
      member do
        get :edit_initial
        patch :update_initial
        get :edit_details
        
        # Resolve flags for a specific employee
        post :resolve
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
    resources :questions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :question_packets, only: [:index, :new, :create, :edit, :update, :destroy] do
      member do
        get :manage
        patch :update_questions
      end
    end

    resources :forum_rooms, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  ########################
  ####  PUBLIC ROUTES  ###
  ########################

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
  resources :employee_views do
    resources :employee_ratings, only: [:select_context, :new, :create], controller: 'ratings', path: 'employees/:employee_id/ratings' do
      get :select_context, on: :member
    end
    member do
      get 'summary/:employee_id', to: 'employee_views#summary', as: 'summary'

      post 'flag_employee/:employee_id', to: 'employee_views#flag', as: 'flag_employee'
    end
  end

  # Public Routes for Viewing Career Path Views
  resources :career_views, only: :show

  # Public Routes for Viewing Interview Question Views
  resources :interview_questions, only: [:index, :show]

  # Public Routes for Viewing Interview Question Packets
  resources :question_packets, only: [:index, :show] do
    post :options, on: :member
  end

  # For toggling star questions on or off
  resources :questions_users, only: [] do
    post :toggle_star, on: :collection
  end

  # Public Routes for Viewing Forums and Posts
  resources :forum_rooms, only: [:index, :show] do
    resources :posts, only: [:new, :create, :show] do
      resources :forum_comments, only: [:create, :destroy]
    end
  end

  # Public Routes for Viewing Mock Interviews
  resources :mock_interviews, only: %i[create destroy index] do
    member do
      patch :accept
      patch :complete
    end
  
    collection do
      get :meeting_board
    end
  end
  

  # Public Routes for Creating Mock Interview Profiles
  resources :mock_interview_profiles, only: [:new, :create, :edit, :update]





  


  
  # Navigation parts of the site
  root "site#home"
  get "/about", to: "site#about"
  get "/contact", to: "site#contact"




end
