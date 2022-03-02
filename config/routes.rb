Rails.application.routes.draw do
  get 'artworks/index'
  get 'artworks/new'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'my_auctions', to: 'pages#my_auctions', as: 'my_auctions'
  resources :artworks, only: [:index, :new, :create, :show]
<<<<<<< HEAD
  resources :auctions
=======
  resources :auctions, only: [:new, :create, :show]
>>>>>>> 2d85bfa4966d0e8037c2fb25c6091c7522e7987f
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
