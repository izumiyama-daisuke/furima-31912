Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
end


#Rails.application.routes.draw do
  
#  devise_for :users
#  get 'prototypes/index'
#  root to: "prototypes#index"

#  resources :users, only: :show
#  resources :prototypes do
    #resources :comments, only: :create
#    resources :comments, only: [:index, :create]
#  end
  
#end
