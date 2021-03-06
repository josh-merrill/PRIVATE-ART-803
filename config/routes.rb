Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :artworks, only: [:index, :new, :create, :show]
  resources :auctions, only: [:index, :new, :create, :show] do
    resources :auction_items, only: [:index, :show, :new, :create] do
      resources :bids, only: [:create, :show]
    end
  end
  resources :bids, only: [:index]
  get 'profile', to: 'pages#profile', as: 'profile'
  post 'profile', to: 'pages#update', as: 'update_photo'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'my_auctions', to: 'pages#my_auctions', as: 'my_auctions'
  resources :auction_items, only: [] do
    member do
      patch 'finish_bid'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
