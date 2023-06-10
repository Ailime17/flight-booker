Rails.application.routes.draw do
  get 'flights/index'
  resources :bookings, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "flights#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
