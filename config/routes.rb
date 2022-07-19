Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
