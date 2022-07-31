Rails.application.routes.draw do
  mount ActionCable.server => '/cable' #アクションケーブルを有効化

  get 'rooms/index'
  root 'pages#index'
  get 'pages/index'
  get 'pages/show'
  devise_for :users
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update]
  resources :notifications, only: [:index]
  resources :rooms, only: [:index]
end
