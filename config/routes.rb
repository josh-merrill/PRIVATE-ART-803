Rails.application.routes.draw do
  get 'auction/show'
  get 'artworks/index'
  get 'artworks/new'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :artworks, only: [:index, :new, :create, :show]
  resources :auctions, only: [:new, :create, :show] do
    resources :auction_items, only: [:show, :new, :create] do
      resources :bids, only: [:create, :show]
    end
  end
  resources :bids, only: [:create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
