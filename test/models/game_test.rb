require 'test_helper'

describe Game do

  describe 'relations' do
    it "has two players" do
      games(:one).players.length.must_equal 2
    end
  end

  describe 'validations' do
    let(:game) { games(:one) }

    it "must be valid" do
      game.valid?.must_equal true
    end

    it "is invalid with wrong value of columns" do
      game.columns = 3
      game.valid?.must_equal false
    end

    it "is invalid with wrong value of rows" do
      game.rows = 3
      game.valid?.must_equal false
    end
  end

end
