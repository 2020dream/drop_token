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
end
