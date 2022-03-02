Rails.application.routes.draw do
<<<<<<< HEAD
  #get 'artworks/index'
  #get 'artworks/new'
  devise_for :users
=======
  devise_for :users, only: [:artists]
>>>>>>> 39945aca3788dc37c014638b7a0010e241b20293
  root to: 'pages#home'
  resources :artworks, only: [:new, :create]
  resources :auctions, only: [:new, :create, :edit, :update, :destroy]
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'my_auctions', to: 'pages#my_auctions', as: 'my_auctions'
  # get 'artworks/index'
  # get 'artworks/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
