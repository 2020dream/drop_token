class Player < ApplicationRecord
    has_many :moves
    belongs_to :game

    validates :name, presence: true, uniqueness: true
end
