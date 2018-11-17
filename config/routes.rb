Rails.application.routes.draw do

  resources :games, only: [:index, :show, :create]

  resources :games, only: [:show] do
    resources :moves, only: [:index, :show, :create]
  end
  
end
