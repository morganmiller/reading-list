Rails.application.routes.draw do
  root 'links#index'

  get '/signup' => 'users#new'
  resources :users, only: [:create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :links, only: [:create, :update]
end
