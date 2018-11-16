class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(id: params[:id])

    if @game.nil?
      render json: { ok: false, :errors => "Game not found" }, status: :not_found      
    else
      if !@game.winner
        render json: @game.as_json(only: :state, :include => { :players => { only: :name }}), status: :ok
      else 
        render json: @game.as_json(only: [:state, :winner], :include => { :players => { only: :name }}), status: :ok
      end
    end

  end

  def create

  end

end
