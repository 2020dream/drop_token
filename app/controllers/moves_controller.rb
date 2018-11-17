class MovesController < ApplicationController
  def index
    @moves = Move.all
  end

  def show
  end

  def create
  end
end
