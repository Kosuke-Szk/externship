Rails.application.routes.draw do
  resources :project
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  get 'home/index'
  root to: 'home#index'
end
