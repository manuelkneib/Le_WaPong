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

puts "Creating seed base"
names = ["Ana", "Andre_actor", "Andre_ta", "Andre_teacher", "Barbara", "Carlos", "Catarina", "Chiara", "Dal", "Danilo", "Filipa", "Gabriel_richkid", "Gabriel_ta", "Gerardo", "Guilherme", "Havard", "Henrique", "Ines", "Joao", "Joaquim", "Joe", "Josh", "Julia", "Loic", "Lorenz", "Manu", "Margarida", "Miguel_bald", "Miguel_hairy", "Pedro", "Ricardo", "Rita", "Roel", "Rory", "Ryan", "Sam", "Sara_1leg", "Sara_ta", "Telo", "Vasco_young", "Vasco_old" , "Will", "Zoe"]
i = 0

puts "Creating seed users"
43.times do
  user = User.new(
    username: names[i],
    email: "#{names[i]}@lewapong.fun",
    password: "123456"
  )
  user.save
  puts "#{user.username} - seeded to DB: #{user.save}"
  i += 1
end

puts "Creating seed leagues"
15.times do
  league = League.new(
    name: "#{Faker::Superhero.power} League",
    sport: Faker::Sports.unusual_sport
  )
  league.save
  puts "#{league.name} - seeded to DB: #{league.save}"
end

puts "Creating seed matches"
