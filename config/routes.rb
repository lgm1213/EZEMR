Rails.application.routes.draw do

  # static pages
  root to: 'landing#home'
  get 'landing/about'
  get 'landing/help'
  get 'landing/contact'

  # user routes
  resources :users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/users/id/edit' => 'users#edit'

  # session routes
  get 'session/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'



end
