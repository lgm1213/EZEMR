Rails.application.routes.draw do


  # user routes
  resources :users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/users/id/edit' => 'users#edit'


  # static pages
  root to: 'landing#home'
  get 'landing/about'
  get 'landing/help'
  get 'landing/contact'

end
