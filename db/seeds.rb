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
  
  law=LawProject.create(name: Faker::Name.first_name,
  description: Faker::Lorem.paragraph, 
  publication_date: Faker::Date.backward(1),
  yes_votes: Faker::Number.number(3), 
  not_votes: Faker::Number.number(3))
  
  rand(1..10).times do
    law.galleries.create(
    route: Faker::File.file_name('uploads', Faker::Config.random.seed, 'jpg', '/'))
  end
  
    
  1.times do |row|
    User.create(email: Faker::Internet.email,
    encrypted_password: Faker::Lorem.word,
    sign_in_count: Faker::Number.number(2))
    
    rand(1..10).times do
      law.opinions.create(
      content: Faker::ChuckNorris.fact,
      date: Faker::Date.backward(1),
      like: Faker::Number.number(2),
      pro: Faker::Boolean.boolean
      )
    end
    
  end
  puts 'Listo Users'

  rand(1..10).times do
    law.tags.create(
    name: Faker::Lorem.word,
    icon_route: Faker::Date.backward(1)
    )
  end
   
end


puts 'Completado LawProject'
puts 'Inicio FeaturedProject'
100.times do |row|
  
  FeaturedProject.create(year: "2018", week: Faker::Number.number(1), day: Faker::Number.number(1), law_project_id: Faker::Number.number(2)
  
  )
  
   
end
puts 'Fin Featured Project'
puts 'Llenando Users'

