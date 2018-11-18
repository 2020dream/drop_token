class Move < ApplicationRecord
  belongs_to :game
  belongs_to :player

  validates :column, :allow_blank => true, :numericality => { only_integer: true, less_than: 4 }
end
