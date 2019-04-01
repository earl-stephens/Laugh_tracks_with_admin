Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "comedians#welcome"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  resources :comedians, only: [:index, :new, :create]

  resources :users, only: [:new, :create, :show]
end
