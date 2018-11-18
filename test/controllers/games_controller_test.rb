require 'test_helper'

describe GamesController do

  describe 'index' do
    it "should get games" do
      get get_games_url
      must_respond_with 200
    end
  end

  describe 'show' do
    it "can get a game" do
      get get_game_url(games(:one).id)
      must_respond_with 200
    end

    it "returns 404 for games that are not found" do
      get get_game_url(3000)
      must_respond_with 404
    end
  end

  describe 'create' do
    it "can create a valid game" do
      game = {
        columns: 4,
        rows: 4,
        players: [
          { name: 'test1' },
          { name: 'test2' }
        ]
      }

      proc {
        post add_game_url, params: game
      }.must_change 'Game.count', 1
      body = JSON.parse(response.body)

      must_respond_with 200
      body.keys.must_include 'id'
    end

    it "should return 400 when given wrong columns/rows" do
      game = {
        columns: 1,
        rows: 2,
        players: [
          { name: 'test1' },
          { name: 'test2' }
        ]
      }

      proc {
        post add_game_url, params: game
      }.must_change 'Game.count', 0
      body = JSON.parse(response.body)

      must_respond_with 400
    end

    it "should return 400 when given wrong number of players" do
      game = {
        columns: 4,
        rows: 4,
        players: [
          { name: 'test1' }
        ]
      }

      proc {
        post add_game_url, params: game
      }.must_change 'Game.count', 0
      body = JSON.parse(response.body)

      must_respond_with 400
    end
  end
  
end
