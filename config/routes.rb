Rails.application.routes.draw do
  get 'foods/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show, :index]
  resources :foods
  root 'home#top'
end
