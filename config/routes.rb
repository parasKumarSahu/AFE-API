Rails.application.routes.draw do
  resources :quotes
  resources :actors
  resources :authors
  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
