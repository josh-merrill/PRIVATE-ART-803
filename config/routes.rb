Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile', as: 'profile'
  resources :pages, only: [:profile]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
