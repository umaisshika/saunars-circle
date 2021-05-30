Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  namespace :admins do
    resources :foods, only: [:index, :show, :edit, :update, :delete] do
      resources :comments, only: :destroy
    end
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    
  end

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    member do
      get :followings, :followers, :like_foods
    end
  end
  get "following_foods" => "foods#following_foods"
  
  resources :foods do
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
  root 'home#top'
end
