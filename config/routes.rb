Rails.application.routes.draw do

  resources :games, only: [:index, :show, :create]

  resources :games, only: [:show] do
    resources :moves, only: [:index, :show]
  end
  
  post '/games/:gameId/:playerId', to: 'moves#create', as: 'move'

  delete '/games/:gameId/:playerId', to: 'moves#quit', as: 'quit'

end
