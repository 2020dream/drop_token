games = JSON.parse(File.read('db/seeds/games.json'))
games.each do |game|
    Game.create!(game)
end

Player.create!(name: 'Elsa', game: Game.all[0])
Player.create!(name: 'Anna', game: Game.all[0])
Player.create!(name: 'Olaf', game: Game.all[1])
Player.create!(name: 'Kristoff', game: Game.all[1])

Move.create!(category: 'Move', column: 0, move_number: 0, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 1, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 0, move_number: 2, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 3, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 1, move_number: 4, game: Game.all[0], player: Player.all[0])
Move.create!(category: 'Move', column: 2, move_number: 5, game: Game.all[0], player: Player.all[1])
Move.create!(category: 'Move', column: 1, move_number: 6, game: Game.all[0], player: Player.all[0])