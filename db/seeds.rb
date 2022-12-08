require "faker"

puts "Destroying previous seeds"
Match.destroy_all
League.destroy_all
User.destroy_all
puts "__________________"
puts ""

puts "Creating seed base, just starting..."
names = ["Ana Sousa", "Andre Pires", "Andre Bakiewicz", "Andre Marques", "Barbara Peric", "Carlos Silveira", "Catarina Estevao", "Chiara Biasi", "Dal Robinson", "Danilo Guimaraes", "Filipa Merino", "Gabriel Fernandes", "Gabriel Pereira", "Gerardo Wemans", "Guilherme Vasconcelos", "Havard Steffensen", "Henrique Albuquerque", "Ines Correia", "Joao Sanches", "Joaquim Luis", "Joe DePumpo", "Josh Merrill", "Julia Wald", "Loic Thieffry", "Lorenz Ploch", "Manuel Kneib", "Margarida Toureiro", "Miguel Figueiredo", "Miguel Silva", "Pedro Agostinho", "Ricardo Mendes", "Rita Laia", "Roel de Jong", "Rory Carter-Motley", "Ryan Hillman", "Samuel van de Ven", "Sara Schoonover", "Sara Vieira", "Diogo Telo de Castro", "Vasco Cardoso", "Vasco Correia" , "Will May", "Zoe van Perlstein" ]
puts "__________________"
puts ""

puts "Creating seed users, we're getting there..."
puts "__________________"

names.each do |name|
  firstname = name.split.first
  lastname = name.split.drop(1).join(" ")

  user = User.create!(
    first_name: firstname,
    last_name: lastname,
    email: "#{firstname.downcase}.#{lastname.first.downcase}#{lastname[1]}@lewapong.fun",
    password: "123456"
  )
  puts "#{user.first_name} #{user.last_name} - seeded to DB: #{user.save}"
end

puts "__________________"
puts ""

puts "Creating seed leagues, almost there..."
puts "__________________"
users = User.all
sports = ["Ping Pong", "Tennis", "Darts", "Billiard", "Beer Pong", "Foosball", "Arm Wrestling", "Marbles", "Weightlifting", "Coding", "Karaoke", "Boxing"]

creator = User.first.id
43.times do
  league = League.create!(
    name: "#{Faker::Superhero.power} League",
    sport: sports.sample,
    creator_id: creator
  )
  UserLeague.create!(
    league_id: league.id,
    user_id: creator,
    points: 0
  )
  puts "#{league.name} - competing in: #{league.sport} - owned by user: #{User.find(league.creator_id).first_name} - seeded to DB: #{!league.user_leagues.empty?}"
  9.times do
    user = users.sample
    if UserLeague.find_by(user: user, league: league).nil?
      UserLeague.create!(
        league_id: league.id,
        user: user,
        points: 0
      )
      puts "User #{user.email} added to #{league.name}!"
    end
  end
  creator += 1
end
puts "__________________"
puts ""
puts "seeding completed, let's f*cking gooooo!!!"
