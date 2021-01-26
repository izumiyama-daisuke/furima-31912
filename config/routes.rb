Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create]
end