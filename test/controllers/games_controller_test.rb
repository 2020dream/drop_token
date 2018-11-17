require 'test_helper'

describe GamesController do
  describe 'index' do
    it "should get index" do
      get games_url
      must_respond_with :success
    end
  end

  describe 'show' do
    it "can get a game" do
      get game_path(games(:one).id)
      must_respond_with :success
    end

    it "returns 404 for games that are not found" do
      get game_path(100)
      must_respond_with :not_found
    end

    # TODO: fix this
    # it "returns 400 for malformed request" do
    #   get game_path("fake_id")
    #   must_respond_with :bad_request
    # end
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
        post games_url, params: game
      }.must_change 'Game.count', 1
      body = JSON.parse(response.body)

      must_respond_with :success
      body.keys.must_include 'id'
    end

    it "should return 400 when given an invalid game" do
      game = {}

      proc {
        post games_url, params: game
      }.must_change 'Game.count', 0
      body = JSON.parse(response.body)

      must_respond_with :bad_request
    end
  end
end
