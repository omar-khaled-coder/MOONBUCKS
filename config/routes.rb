Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"

  get "/basket", to: "pages#basket"
  post "/add_to_cart", to: "pages#add_to_cart"
  get '/remove_from_cart/:cart_item_id', to: 'pages#remove_from_cart', as: 'remove_from_cart'

  # Other routes...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
