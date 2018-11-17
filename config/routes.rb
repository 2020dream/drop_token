Rails.application.routes.draw do

  resources :games, only: [:index, :show, :create]

  get '/drop_token/:gameId/moves', to: 'moves#index', as: 'get_moves'

  get '/drop_token/:gameId/moves/:move_number', to: 'moves#show', as: 'get_move'
  
  post '/drop_token/:gameId/:playerId', to: 'moves#create', as: 'move'

  delete '/drop_token/:gameId/:playerId', to: 'moves#quit', as: 'quit'

end
