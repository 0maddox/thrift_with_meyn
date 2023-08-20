Rails.application.routes.draw do
  post 'signup', to: 'registration#create'
  get 'login', to: 'authorization#new'
  post 'login', to: 'authorization#login'
  delete 'logout', to: 'authorization#logout'
  get 'me', to: 'authorization#me'  # Add this line

  resources :categories, only: [:index, :show, :create, :update, :destroy]
  
  resources :clothing_items do
    member do
      post 'add_to_favorites'
      post 'make_reservation'
      post 'make_payment'
      post 'rate'
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  resources :reservations, only: [:create, :update, :destroy]
  resources :payments, only: [:create, :show]
  resources :ratings, only: [:create]
end
