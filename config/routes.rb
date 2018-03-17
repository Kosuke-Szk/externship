Rails.application.routes.draw do
  get 'employee/show'
  get 'user/show'

  get 'home/login_window'

  resources :project
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :company, :controllers => 'companies'
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  resources :user
  get 'home/index'
  root to: 'home#index'
end
