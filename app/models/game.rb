class Game < ApplicationRecord
    has_many :moves
    has_many :players

    validates :columns, :numericality => { equal_to: 4 }
    validates :rows, :numericality => { equal_to: 4 }

    def self.create_with_players(game_params)
        columns = game_params[:columns]
        rows = game_params[:rows]
        players = game_params[:players]

        game = Game.create(columns: columns, rows: rows, state: "IN_PROGRESS")
        if players != nil
            players.each do |player|
                Player.create(name: player[:name], game_id: game.id)
            end
        end

        return game
    end
    
    def won?
        return false
    end
end
