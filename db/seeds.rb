# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Players
10.times do
  Player.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, nick_name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone)
end

# Games
2.times do
  game = Game.create(title: Faker::Name.unique.name, description: Faker::Lorem.paragraph)

  # Matches
  2.times do |i|
    attrs = [{ game_id: game.id, player_id: Player.first.id }, { game_id: game.id, player_id: Player.second.id }]
    Match.create(name: "Round #{i}", participants_attributes: attrs)
  end
end
