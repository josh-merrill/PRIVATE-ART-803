Rails.application.routes.draw do
  get 'artworks/index'
  get 'artworks/new'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :artworks, only: [:index, :new, :create, :show]
  resources :auctions, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
