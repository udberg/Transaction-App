Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get 'main', to: 'profil#index'

  get 'transaction', to: 'transactions#index'
  get 'create_transaction', to: 'transactions#new'
  post 'transaction', to: 'transactions#create'

  get 'ext_transaction', to: 'transactions#external'



  get 'group', to: 'groups#index'
  post 'group', to: 'groups#show'

  get 'create_group', to: 'groups#new'
  post 'create_group', to: 'groups#create'

  get 'add_transaction', to: 'transactions#update'
  post 'add_transaction', to: 'transactions#group'

  delete "log_out", to: "sessions#destroy"
  root to: "sessions#new"
end
