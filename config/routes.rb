Rails.application.routes.draw do
  get 'pages/index'
  get 'home/index'
  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/edit'
  get 'groups/create'
  get 'groups/update'
  get 'groups/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  
  resources :organisations
  resources :groups
  # Defines the root path route ("/")
  # root "articles#index"
end
