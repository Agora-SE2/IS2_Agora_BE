# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
puts 'Llenando LawProjects'

100.times do |row|
  LawProject.create(name: Faker::Name.first_name,
  description: Faker::Lorem.paragraph, 
  publication_date: Faker::Date.backward(days = 1),
  yes_votes: Faker::Number.number(3), 
  not_votes: Faker::Number.number(3))
end

puts 'Completado LawProject'