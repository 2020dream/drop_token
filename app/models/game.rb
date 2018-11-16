class Game < ApplicationRecord
    has_many :moves
    has_many :players
end
