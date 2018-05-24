# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'
source = 'https://www.datos.gov.co/resource/gd35-72eh.json'
resp = Net::HTTP.get_response(URI.parse(source))
data = resp.body
json = ActiveSupport::JSON.decode(data)

require 'faker'

1.times do |row|

  Tag.create(
  name: "Cultura",
  icon_route: Faker::Date.backward(1)
  )
  
  
  Tag.create(
  name: "Derecho",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Crimen",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Economía",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Medio Ambiente",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Salud",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Educación",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "Ciencia",
  icon_route: Faker::Date.backward(1)
  )
  
  Tag.create(
  name: "JEP",
  icon_route: Faker::Date.backward(1)
  )

end 
puts 'Listo Tags'

puts 'Llenando LawProjects'
json.each do |a|
  if a['estado_del_proyecto_de_ley']!="LEY" and a['estado_del_proyecto_de_ley']!="ARCHIVADO" and a['estado_del_proyecto_de_ley']!="RETIRADO"
    law=LawProject.create!(name: a['nombre_del_proyecto_de_ley'],
    description: a['senado'], 
    publication_date: Faker::Date.backward(1),
    yes_votes: Faker::Number.number(3), 
    not_votes: Faker::Number.number(3),
    speaker: a['tipo_de_proyecto'],
    state: a['estado_del_proyecto_de_ley'],
    ready: 0)
  
  
    rand(1..10).times do
      law.galleries.create!(
      route: Faker::File.file_name('uploads', Faker::Config.random.seed, 'jpg', '/'))
    end
  
    donetags = []
    rand(1..4).times do |raw|  
      basetag=rand(1..9)
      if !donetags.include?(basetag)
        ProjectTag.create!(
        tag_id: basetag, 
        law_project_id: law.id)
        donetags.push(basetag)
      end
    end
    
    1.times do |raw|
      
      user=User.create(email: Faker::Internet.email,
      password: 'topsecret', 
      password_confirmation: 'topsecret',
      is_admin: Faker::Boolean,
      sign_in_count: Faker::Number.number(2),
      user_name: Faker::Twitter.screen_name,
      birth_name: Faker::Superhero.name,
      description: Faker::ChuckNorris.fact)
      user.skip_confirmation!
      user.save!
      
      rand(1..10).times do
        law.opinions.create!(
        content: Faker::ChuckNorris.fact,
        date: Faker::Date.backward(1),
        like: Faker::Number.number(2),
        pro: Faker::Boolean.boolean,
        user_id: rand(1..user.id+1),
        law_project_id: law.id
        )
      end
      
    end
    puts 'Listo Users'
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

