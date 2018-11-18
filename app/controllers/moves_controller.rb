class MovesController < ApplicationController

  def index
    @game = Game.find_by(id: params[:gameId])

    if @game.nil?
      render json: { :errors => "Game not found." }, status: 404
    else
      @moves = @game.moves
    end
  end

  def show
    @game = Game.find_by(id: params[:gameId])

    if @game.nil?
      render json: { :errors => "Game not found." }, status: 404
    else
      @move = @game.moves.find_by(move_number: params[:move_number])

      if @move.nil?
        render json: { :errors => "Move not found." }, status: 404 
      else
        render json: @move.as_json(only: [:type, :column], :include => { :player => { only: :name }}), status: 200
      end
    end
  end

  def create
    @game = Game.find_by(id: params[:gameId])

    if @game.nil?
      render json: { :errors => "Game is not found." }, status: 404
    else
      @player = Player.find_by(id: params[:playerId])

      if @player.nil?
        render json: { :errors => "Player is not found." }, status: 404
      elsif !@game.players.include?(@player)
        render json: { :errors => "Player is not a part of this game." }, status: 404
      elsif @game.state == "Done"
        render json: {:errors => "Game is already in DONE state."}, status: 410
      elsif @game.moves.count != 0 && @game.moves.last.player.id == @player.id
        render json: { :errors => "Player tried to post when it's not their turn." }, status: 409
      elsif @game.moves.where(column: params[:column]).count >= 4
        render json: { :errors => "Column is full. Please choose another column." }, status: 400
      else
        Move.create(category: 'Move', column: params[:column], move_number: @game.moves.count, game: @game, player: @player)

        if @game.won?
          @game.update(state: "Done", winner: @player.name)
          render json: { :messages => "Move added successfully. And #{@player.name} just won the game! Congrats!" }, status: 200
        elsif @game.moves.count == 16
          @game.update(state: "Done")
          render json: { :messages => "Game over. There is no winner." }, status: 200
        else
          render json: { :messages => "Move added successfully." }, status: 200
        end 
      end
    end
    
  end

  def quit
    @game = Game.find_by(id: params[:gameId])

    if @game.nil?
      render json: { :errors => "Game is not found." }, status: 404
    else
      @player = Player.find_by(id: params[:playerId])
      if @player.nil?
        render json: { :errors => "Player is not found." }, status: 404
      elsif !@game.players.include?(@player)
        render json: { :errors => "Player is not a part of this game." }, status: 404
      elsif @game.state == "Done"
        render json: { :errors => "Game is already in DONE state." }, status: 410
      else
        loser_id = @player.id
        @winner = nil
        @game.players.each do |player|
          if player.id != loser_id
            @winner = player
          end
        end

        if !@winner.nil?
          @game.update(state: "Done", winner: @winner.name)
          total_moves = @game.moves.count

          Move.create(category: 'Quit', move_number: total_moves, game: @game, player: @player)

          render json: { :messages => "Game over. Winner is #{@winner.name}!" }, status: 200
        end
      end
    end
    
  end

end
