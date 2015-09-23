Rails.application.routes.draw do
  root 'users#new'

  get '/signup' => 'users#new'
  resources :users, only: [:create]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
