Rails.application.routes.draw do
  resources :plants
  resources :cars
  resources :users
  resources :quotes
  resources :actors
  resources :authors
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
