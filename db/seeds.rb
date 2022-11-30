# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

puts "Destroying previous seeds"
User.destroy_all
League.destroy_all
Match.destroy_all
puts "__________________"
puts ""

puts "Creating seed base, just starting..."
first_names = ["Ana", "Andre", "Andre", "Andre", "Barbara", "Carlos", "Catarina", "Chiara", "Dal", "Danilo", "Filipa", "Gabriel", "Gabriel", "Gerardo", "Guilherme", "Havard", "Henrique", "Ines", "Joao", "Joaquim", "Joe", "Josh", "Julia", "Loic", "Lorenz", "Manuel", "Margarida", "Miguel", "Miguel", "Pedro", "Ricardo", "Rita", "Roel", "Rory", "Ryan", "Samuel", "Sara", "Sara", "Telo", "Vasco", "Vasco" , "Will", "Zoe"]
last_names = ["Sousa", "Pires", "Bakiewicz", "Marques", "Peric", "Daniel", "Estevao", "Biasi", "Robinson", "Guimaraes", "Merino", "Fernandes", "Pereira", "Wemans", "Vasconcelos", "Steffensen", "Albuquerque", "Correia", "Sanches", "Luis", "DePumpo", "Merrill", "Wald", "Thieffry", "Ploch", "Kneib", "Toureiro", "Figueiredo", "Silva", "Agostinho", "Mendes", "Laia", "de Jong", "Carter-Motley", "Hillman", "van de Ven", "Schoonover", "Vieira", "de Castro", "Cardoso", "Correia", "May", "van Perlstein"]
i = 0
puts "__________________"
puts ""

puts "Creating seed users, we're getting there..."
puts "__________________"
43.times do
  user = User.new(
    first_name: first_names[i],
    last_name: last_names[i],
    email: "#{first_names[i].downcase}.#{last_names[i][0]}#{last_names[i][1]}@lewapong.fun",
    password: "123456"
  )
  user.save!
  puts "#{user.first_name} #{user.last_name} - seeded to DB: #{user.save}"
  i += 1
end
puts "__________________"
puts ""

puts "Creating seed leagues, almost there..."
puts "__________________"
users = User.all
count = User.first.id
sports = ["Ping Pong", "Darts", "Billiard", "Football", "Beer Pong", "Foosball", "Arm wrestling", "Handball", "Weightlifting", "Coding" ]

15.times do
  league = League.create!(
    name: "#{Faker::Superhero.power} League",
    sport: sports.sample,
    creator_id: users.sample.id
  )
  10.times do
    UserLeague.create!(
      league_id: League.last.id,
      user_id: User.find(count).id,
      points: 0
    )
  end
  count += 1
  puts "#{league.name} - competing in: #{league.sport} - owned by user: #{User.find(league.creator_id).first_name} - seeded to DB: #{!league.user_leagues.empty?} "
end
puts "__________________"
puts ""

puts "seeding completed, let's f*cking gooooo!!!"
