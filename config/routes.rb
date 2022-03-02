Rails.application.routes.draw do
  devise_for :users, only: [:artists]
  root to: 'pages#home'
  resources :artworks, only: [:new, :create]
  resources :auctions, only: [:new, :create, :edit, :update, :destroy] do
    resources :auction_items, only: [:new, :create]
  end
  resources :auction_items, only: [:destroy]
  get 'profile', to: 'pages#profile', as: 'profile'
  get 'my_auctions', to: 'pages#my_auctions', as: 'my_auctions'
  # get 'artworks/index'
  # get 'artworks/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
