Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  get 'users/show'
  devise_for :users
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
