Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end
end
