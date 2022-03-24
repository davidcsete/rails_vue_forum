Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#logedIn"

  get '/login', to: 'user#login'

  match '/register', to: 'user#register', as: 'register', via: [:get, :post]
  resources :users

end
