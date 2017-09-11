Rails.application.routes.draw do
  root to: "messages#index"
  resources :messages, only: [:index, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
