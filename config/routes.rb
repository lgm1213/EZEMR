Rails.application.routes.draw do

  # provider routes
  resources :providers
  get '/providers/signup' => 'proviers#new'
  post '/providers/signup' => 'providers#create'
  post '/providers/id/edit' => 'providers#edit'


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

  # password reset
  get 'password_resets/new'
  get 'password_resets/edit'

  # account acctivation
  resources :account_activations, only: [:edit]

# password resets
  resources :password_resets, only: [:new, :create, :edit, :update]



end
