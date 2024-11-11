Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]
  resources :users

  delete 'logout' => "sessions#destroy", as: 'logout'
  get 'login' => "sessions#login", as: 'login'
  
  get 'admin' => "users#index", as: 'admin'

  get 'reservations/create'
  get 'reservations/index'

  # get 'admin' => "users#index"
  # get 'users/new'
  # post 'users/create'
  # delete 'users/destroy'
  # post 'users/edit/:id' => "users#edit"
  # put 'users/update/:id' => "users#update"

  
  get 'worsystem' => "work_orders#index"
  get 'worsystem/new' => "work_orders#new"
  get 'worsystem/:wor_number/continue' => "work_orders#continue"
  post 'worsystem/create' => "work_orders#create"
  get 'worsystem/cancel' => "work_orders#cancel"
  get 'worsystem/:wor_number/cancel' => "work_orders#cancel"
  get 'worsystem/:wor_number' => "work_orders#show"
  post 'worsystem/:wor_number/review' => "work_orders#review"
  post 'worsystem/:wor_number/approve' => "work_orders#approve"
  put 'worsystem/:wor_number' => "work_orders#update"
  post 'worsystem/:wor_number/continue' => "work_orders#continue"
  get 'worsystem/:wor_number/revoke' => "work_orders#revoke"
  post 'worsystem/:wor_number/close' => "work_orders#close"

  get 'ajax/equipment' => 'ajax_requests#get_equipment'

  
  post 'reservations/create' => "reservations#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "sessions#shortcut_login"
end
