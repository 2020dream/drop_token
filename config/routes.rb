Rails.application.routes.draw do

  get '/drop_token', to: 'games#index', as: 'get_games'

  get '/drop_token/:gameId', to: 'games#show', as: 'get_game'

  post '/drop_token', to: 'games#create', as: 'add_game'

  get '/drop_token/:gameId/moves', to: 'moves#index', as: 'get_moves'

  get '/drop_token/:gameId/moves/:move_number', to: 'moves#show', as: 'get_move'
  
  post '/drop_token/:gameId/:playerId', to: 'moves#create', as: 'move'

  delete '/drop_token/:gameId/:playerId', to: 'moves#quit', as: 'quit'

end
