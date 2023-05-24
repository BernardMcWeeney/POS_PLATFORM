Rails.application.routes.draw do

  get 'pages/index'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  
  resources :organisations
  resources :groups
  resources :memberships
  resources :locations
  # Defines the root path route ("/")
  # root "articles#index"
end
