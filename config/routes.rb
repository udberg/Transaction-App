Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  get 'external_payments', to: 'payments#external_payment'
  resources :user, only: [:show]
  resources :payments, except: [:show]
  resources :groups, except: [:destroy, :update]
end
