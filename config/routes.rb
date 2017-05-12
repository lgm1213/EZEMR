Rails.application.routes.draw do


  # static pages
  root to: 'landing#home'
  get 'landing/about'
  get 'landing/help'
  get 'landing/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
