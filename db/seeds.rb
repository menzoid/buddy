# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "destroying users, intentions, events, categories"

Event.destroy_all
User.destroy_all
Intention.destroy_all
Category.destroy_all


puts "destroyed all"

puts "creating users"
User.create(username: Faker::FunnyName.two_word_name, email: 'master@games.com', password: '123456')
User.create(username: Faker::FunnyName.two_word_name, email: 'zemanel@games.com', password: '123456')
User.create(username: Faker::FunnyName.two_word_name, email: 'slave@games.com', password: '123456')

puts "users created"
puts "creating categories"

Category.create(name: 'Football')
Category.create(name: 'Tennis')
Category.create(name: 'Adventure')
Category.create(name: 'Live Music')
Category.create(name: 'Festival')
Category.create(name: 'Food')
Category.create(name: 'Road Trip')
Category.create(name: 'Theatre')
Category.create(name: 'Museum')

puts "categories created"
puts "creating intentions"

Intention.create(name: 'Experience')
Intention.create(name: 'Party')
Intention.create(name: 'Meet People')
Intention.create(name: 'Listen to Music')
Intention.create(name: 'Explore')
Intention.create(name: 'Excersise')
Intention.create(name: 'Adventure')
Intention.create(name: 'Cultural')
Intention.create(name: 'Find Love')

puts "intentions created"
puts "creating events"

20.times do
  Event.create(
    name: Faker::Book.title,
    address: Faker::Address.street_address,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    date: Faker::Date.forward(days: 60),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    category_id: Category.all.sample.id
  )

  puts "events created"
end
