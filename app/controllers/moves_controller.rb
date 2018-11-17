class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
    @move = Move.find_by(move_number: params[:id])

    if @move.nil?
      render json: { ok: false, :errors => "Move not found" }, status: :not_found 
    else
      render json: @move.as_json(only: [:type, :column], :include => { :player => { only: :name }}), status: :ok
    end
  end

  def create
  end
end
