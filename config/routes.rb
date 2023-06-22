Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :update]
  resources :authors, only: [:show, :create]
end
