Rails.application.routes.draw do
  root to: "messages#index"
  resources :messages, only: [:index, :create, :destroy]
end
