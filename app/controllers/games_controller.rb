class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])

    if @game.nil?
      render json: { :errors => "Game not found." }, status: 404      
    else
      if !@game.winner
        render json: @game.as_json(only: :state, :include => { :players => { only: :name } } ), status: 200
      else 
        render json: @game.as_json(only: [:state, :winner], :include => { :players => { only: :name } } ), status: 200
      end
    end

  end

  def create
    @game = Game.create_with_players(game_params)

    if @game.valid?
      render json: @game.as_json(only: :id), status: 200
    else
      render json: { :errors => "Malformed request: Columns and rows should be 4. And number of players should exactly be 2." }, status: 400
    end
  end

  private

  def game_params
    return params.permit(:columns, :rows, players: [:name])
  end
end
