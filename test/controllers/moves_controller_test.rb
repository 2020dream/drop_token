require 'test_helper'

describe MovesController do

  describe 'index' do
    it "should get moves for a game" do
      get get_moves_url(gameId: games(:one).id)
      must_respond_with 200
    end

    it "should return 404 is game is not found" do
      get get_moves_url(gameId: 3000)
      must_respond_with 404
    end
  end

  describe 'show' do
    it "should get move for a game" do
      get get_move_url(gameId: games(:one).id, move_number: games(:one).moves.first.move_number)
      must_respond_with 200
    end

    it "should return 404 if game is not found" do
      get get_move_url(gameId: 3000, move_number: 0)
      must_respond_with 404
    end

    it "should return 404 if move is not found in an existing game" do
      get get_move_url(gameId: games(:one).id, move_number: 3000)
      must_respond_with 404
    end
  end

  describe 'create' do
    it "can create a valid move" do
      proc {
        post move_url(gameId: games(:four).id, playerId: players(:eight).id, column: 2)
      }.must_change 'Move.count', 1

      must_respond_with 200
    end

    it "returns 404 if game is not found" do
      proc {
        post move_url(gameId: 3000, playerId: players(:eight).id, column: 2)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "returns 404 if player is not found" do
      proc {
        post move_url(gameId: games(:four).id, playerId: 3000, column: 2)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "returns 404 if player is not part of the game" do
      proc {
        post move_url(gameId: games(:four).id, playerId: players(:one).id, column: 2)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "returns 410 if game is already in Done state" do
      proc {
        post move_url(gameId: games(:five).id, playerId: players(:nine).id, column: 2)
      }.must_change 'Move.count', 0

      must_respond_with 410
    end

    it "returns 409 if player tried to post when it's not their turn" do
      proc {
        2.times do 
          post move_url(gameId: games(:four).id, playerId: players(:seven).id, column: 2)
        end
      }.must_change 'Move.count', 1

      must_respond_with 409
    end

    it "return 400 if column is full" do
      post move_url(gameId: games(:four).id, playerId: players(:seven).id, column: 2)
      post move_url(gameId: games(:four).id, playerId: players(:eight).id, column: 2)
      post move_url(gameId: games(:four).id, playerId: players(:seven).id, column: 2)
      post move_url(gameId: games(:four).id, playerId: players(:eight).id, column: 2)

      proc {
        post move_url(gameId: games(:four).id, playerId: players(:seven).id, column: 2)
      }.must_change 'Move.count', 0

      must_respond_with 400
    end
  end

  describe 'quit' do
    it "lets player quit the game" do
      proc {
        delete quit_url(gameId: games(:four).id, playerId: players(:eight).id)
      }.must_change 'Move.count', 1

      games(:four).moves.last.category.must_equal 'Quit'
      must_respond_with 200
    end

    it "returns 404 if game is not found" do
      proc {
        delete quit_url(gameId: 3000, playerId: players(:eight).id)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "returns 404 if player is not found" do
      proc {
        delete quit_url(gameId: games(:four).id, playerId: 3000)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "returns 404 if player is not part of the game" do
      proc {
        delete quit_url(gameId: games(:four).id, playerId: players(:one).id)
      }.must_change 'Move.count', 0

      must_respond_with 404
    end

    it "return 410 if game is already in Done state" do
      proc {
        delete quit_url(gameId: games(:five).id, playerId: players(:nine).id)
      }.must_change 'Move.count', 0

      must_respond_with 410
    end
  end

end