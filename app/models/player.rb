class Player < ApplicationRecord
    has_many :moves
    belongs_to :game
end
