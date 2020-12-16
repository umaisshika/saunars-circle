Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :index, :destroy] do
    member do
      get :followings, :followers, :like_foods
    end
  end
  get "following_foods" => "foods#following_foods"
  resources :foods do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
  root 'home#top'
end
