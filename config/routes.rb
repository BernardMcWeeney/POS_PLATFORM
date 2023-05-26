Rails.application.routes.draw do

  get 'pages/index'
  get 'home/index'
  post '/switch_location', to: 'sessions#switch_location', as: 'switch_location'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  
  resources :organisations
  resources :organisation_memberships

  resources :groups do
    member do
      post 'assign_product'
      put 'change_product_assignment'
    end
  end
  resources :group_memberships

  resources :locations
  resources :location_memberships

  resources :stores
  resources :products
  resources :users
  resource :cart, only: [:show]
  resources :orders
  resources :cart_items, only: [:create, :edit, :update, :destroy]

  resources :memberships

  resources :carts do
    get 'checkout', on: :member
  end


  get '/memberships_dashboard', to: 'memberships_dashboard#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
