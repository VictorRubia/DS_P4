Rails.application.routes.draw do
  get 'homepage/new'
  get 'homepage/create'
  get 'login/new'
  get 'login/create'
  devise_for :users
  resources :transfers
  resources :employees
  resources :investments
  resources :requests
  resources :transactions
  resources :loans
  resources :cards
  resources :accounts
  resources :developers
  resources :projects
  root "homepage#index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :accounts
      resources :login
      resources :loans
      resources :transactions
      resources :requests
      resources :investments
      resources :cards
      resources :transfers
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end