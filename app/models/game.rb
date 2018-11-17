class Game < ApplicationRecord
    has_many :moves
    has_many :players

    validates :columns, :numericality => { equal_to: 4 }
    validates :rows, :numericality => { equal_to: 4 }

    def self.create_with_players(game_params)
        columns = game_params[:columns]
        rows = game_params[:rows]
        players = game_params[:players]

        if players.nil? || players.count != 2
            return nil
        end

        game = Game.create(columns: columns, rows: rows, state: "IN_PROGRESS")
        players.each do |player|
            Player.create(name: player[:name], game_id: game.id)
        end

        return game
    end
    
    def won?
        board_matrix = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
        column_position = [3, 3, 3, 3]
        current_value = 1
        moves = self.moves.sort_by { |move| move.move_number }
        moves.each do |move|
            board_matrix[column_position[move.column]][move.column] = current_value
            current_value = -current_value
            column_position[move.column] -= 1
        end

        if win_horizontal?(board_matrix) || win_vertical?(board_matrix) || win_diagonal?(board_matrix)
            return true
        else
            return false
        end
    end

    private

    def win_horizontal?(board_matrix)
        board_matrix.each do |row|
            if row.sum == 4 || row.sum == -4
                return true
            end
        end
        return false
    end

    def win_vertical?(board_matrix)
        trans_matrix = board_matrix.transpose
        trans_matrix.each do |row|
            if row.sum == 4 || row.sum == -4
                return true
            end
        end
        return false
    end
    
    def win_diagonal?(m)
        comb_1 = m[0][0] + m[1][1] + m[2][2] + m[3][3] 
        comb_2 = m[0][3] + m[1][2] + m[2][1] + m[3][0]
        if comb_1 == 4 || comb_1 == -4 || comb_2 == 4 || comb_2 == -4
            return true
        else
            return false
        end
    end
end
