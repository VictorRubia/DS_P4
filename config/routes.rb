Rails.application.routes.draw do
  get 'paginicio/new'
  get 'paginicio/create'
  get 'homepage/new'
  get 'homepage/create'
  get 'login/new'
  get 'login/create'
  get 'paginicio/download_apk'
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
  resources :paginicio
  post '/ajax/sum' => 'accounts#aceptar_prestamo'
  root "paginicio#index"

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
      resources :paginicio
    end
  end

  resources :requests do
    member do
      patch :approve
      put :approve
    end
  end

  resources :requests do
    member do
      patch :deny
      put :deny
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end