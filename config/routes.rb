Rails.application.routes.draw do

  get '_form/edit'

  get '_form/index'

  get '_form/new'

  get '_form/show'

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
