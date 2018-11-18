# Create Game #1 - #5
games = JSON.parse(File.read('db/seeds/games.json'))
games.each do |game|
    Game.create!(game)
end

# Create Players in all 5 games
Player.create!(name: 'Elsa', game: Game.all[0])
Player.create!(name: 'Anna', game: Game.all[0])

Player.create!(name: 'Olaf', game: Game.all[1])
Player.create!(name: 'Kristoff', game: Game.all[1])

Player.create!(name: 'Peppa', game: Game.all[2])
Player.create!(name: 'George', game: Game.all[2])

Player.create!(name: 'Daniel', game: Game.all[3])
Player.create!(name: 'Margaret', game: Game.all[3])

Player.create!(name: 'Xixi', game: Game.all[4])
Player.create!(name: 'Haha', game: Game.all[4])

# Moves for Game #1
Move.create!(category: 'Move', column: 0, move_number: 0, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 1, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 0, move_number: 2, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 3, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 1, move_number: 4, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 5, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 1, move_number: 6, game: Game.all[0], player: Player.all[0])