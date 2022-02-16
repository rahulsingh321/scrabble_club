# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Players
10.times do
  player = Player.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email,
                         nick_name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone)
  puts "Player #{player.first_name} created!"
end

3.times do
  game = Game.create(title: Faker::Game.title, description: Faker::Lorem.paragraph)
  puts "Game #{game.title} created!"

  # Matches
  players = Player.all.sample(2)
  10.times do |i|
    attrs = [{ game_id: game.id, player_id: players[0].id, score: rand(1..100) },
             { game_id: game.id, player_id: players[1].id, score: rand(1..100) }]
    _match = game.matches.create(name: "Round #{i}", participants_attributes: attrs)
    puts "Match with name #{_match.name} created!"
  end
end
