games = JSON.parse(File.read('db/seeds/games.json'))
games.each do |game|
    Game.create!(game)
end

Player.create!(name: 'Elsa', game: Game.all[0])
Player.create!(name: 'Anna', game: Game.all[0])
Player.create!(name: 'Olaf', game: Game.all[1])
Player.create!(name: 'Kristoff', game: Game.all[1])