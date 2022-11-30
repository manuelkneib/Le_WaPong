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

puts "Creating seed base, just starting..."
first_names = ["Ana", "Andre", "Andre", "Andre", "Barbara", "Carlos", "Catarina", "Chiara", "Dal", "Danilo", "Filipa", "Gabriel", "Gabriel", "Gerardo", "Guilherme", "Havard", "Henrique", "Ines", "Joao", "Joaquim", "Joe", "Josh", "Julia", "Loic", "Lorenz", "Manuel", "Margarida", "Miguel", "Miguel", "Pedro", "Ricardo", "Rita", "Roel", "Rory", "Ryan", "Samuel", "Sara", "Sara", "Telo", "Vasco", "Vasco" , "Will", "Zoe"]
last_names = ["Sousa", "Pires", "Bakiewicz", "Marques", "Peric", "Daniel", "Estevao", "Biasi", "Robinson", "Guimaraes", "Merino", "Fernandes", "Pereira", "Wemans", "Vasconcelos", "Steffensen", "Albuquerque", "Correia", "Sanches", "DePumpo", "Merrill", "Wald", "Thieffry", "Ploch", "Kneib", "Toureiro", "Figueiredo", "Silva", "Agostinho", "Mendes", "Laia", "de Jong", "Carter-Motley", "Hillman", "van de Ven", "Schoonover", "Vieira", "de Castro", "Cardoso", "Correia", "May", "van Perlstein"]
i = 0
puts "__________________"

puts "Creating seed users, we're getting there..."
43.times do
  user = User.new(
    firstname: first_names[i],
    lastname: last_names[i],
    email: "#{first_names[i].downcase}@lewapong.fun",
    password: "123456"
  )
  user.save!
  puts "#{user.firstname} #{user.lastname} - seeded to DB: #{user.save}"
  i += 1
end
puts "__________________"

puts "Creating seed leagues, almost there..."
15.times do
  league = League.new(
    name: "#{Faker::Superhero.power} League",
    sport: Faker::Creature::Animal.name,
    creator_id: # needs to be assigned
  )
  league.save!
  puts "#{league.name} - seeded to DB: #{league.save}"
end
puts "__________________"
puts "seeding completed, let's f*cking gooooo!!!"
