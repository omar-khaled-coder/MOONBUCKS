Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"
  get "/basket", to: "pages#basket"
  get 'add_to_cart', to: 'pages#add_to_cart', as: 'add_to_cart'
  post 'add_to_cart', to: 'pages#add_to_cart'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
