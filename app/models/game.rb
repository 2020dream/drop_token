class Game < ApplicationRecord
    has_many :moves
    has_many :players

    validates :columns, :numericality => { equal_to: 4 }
    validates :rows, :numericality => { equal_to: 4 }
end
