Rails.application.routes.draw do
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
  root "accounts#index"

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :accounts
      resources :login
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end