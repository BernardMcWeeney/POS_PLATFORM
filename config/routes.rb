Rails.application.routes.draw do
  get 'pages/index'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  
  resources :organisations
  resources :organisation_memberships

  resources :groups
  resources :group_memberships

  resources :locations
  resources :location_memberships


  resources :memberships

  get '/memberships_dashboard', to: 'memberships_dashboard#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
