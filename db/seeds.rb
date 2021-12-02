# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'

puts "destroying users, intentions, events, categories"

Event.destroy_all
User.destroy_all
Intention.destroy_all
Category.destroy_all

puts "destroyed all"

event_images = ["https://res.cloudinary.com/duw0kzy1b/image/upload/v1638463966/Buddy/volleyball_zaf1rt.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638464265/Buddy/Pilates_x1aubu.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638464612/Buddy/Hike_qdlccf.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638464619/Buddy/Surf_lesson_fgqhrq.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465133/Buddy/Monchique_zp8jno.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465530/Buddy/Art_workshop_flpwlv.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465646/Buddy/Movie_q9kksh.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465774/Buddy/drawing_lbnfq7.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465867/Buddy/Improv_mvtkal.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638466004/Buddy/Streetart_tedt0b.jpg"]

event_names = ["Volley and beer at Campo grande garden",
              "Pilates classes at Work In studio",
              "Hiking on the Enchanted Serra de Sintra",
              "Let's go surfing everyday!",
              "Monchique - SOUTH side slopes",
              "Alternative Portrait Workshop",
              "Film Club: One Flew Over the Cuckoo’s Nest",
              "Drawing Doodling zoom sessions",
              "Improv workshop- short and long form",
              "URBAN TRACES | Street Art Walk & City Game"]

event_address = ["Lumiar, Lisbon", "Caldas da Rainha, Portugal", "Bairro alto, Lisbon", "Moita, Portugal", "Sagres, Portugal", "Faro, Portugal", "Laranjeiras, Lisbon", "Porto, Portugal","Alverca, Portugal", "Caldas da Rainha, Portugal"]

event_description = ["We'll bring our two or three nets to play volleyball at campo grande garden. Theres a cheap tapas restaurant nearby if you want to eat /drink something after.",
                     "We are inviting you to join our Pilates mat workout in a beautiful place at 'Work In studio'",
                     "This is a sweet & easy hike in the forested area of southern Serra de Sintra. We'll start at the charming village of Malveira da Serra, climb to Penedo da Roçada's to enjoy the views",
                     "SURF and EXPERIENCE for First-timers and advanced. We have lessons at 10 or 10:30am, 12 or 12:30pm and 2 or 2:30pm on weekends. 10 or 10:30 during the week.",
                     "This is an international group for lovers of walking, who want to be in the great outdoors, and discovering more of the Western Algarve.",
                     "Alternative portrait workshop is a good opportunity to free your mind, try different approach in painting and to develop your creativity",
                     "The films of this cycle explore the absence of empathy in different social situations.",
                     "Weekly Online Drawing Doodling sessions Fridays 8pm - 9pm Various drawing / doodling activities",
                     "Improv drops you into that wondrous world of high-energy, immediate, person-to-person interaction.",
                     "Discover Lisbon while meeting new people in town and exploring a unique street art walk lead by riddles & tips"]

puts "creating users"
User.create(username: Faker::FunnyName.two_word_name, email: 'master@games.com', password: '123456')
User.create(username: Faker::FunnyName.two_word_name, email: 'zemanel@games.com', password: '123456')
User.create(username: Faker::FunnyName.two_word_name, email: 'slave@games.com', password: '123456')

puts "users created"
puts "creating categories"

Category.create(name: 'Outdoors', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/outdoors_lf0trx.png')
Category.create(name: 'Sports', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Sports_c17b7i.png')
Category.create(name: 'Live Music', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/live-music_xnyk2q.png')
Category.create(name: 'Dining', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Dining_syezer.png')
Category.create(name: 'Travel', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Road-trip_hrgyco.png')
Category.create(name: 'Art', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Museum_d1ll4m.png')
Category.create(name: 'Gaming', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Gaming_nzbdsy.png')
Category.create(name: 'Partying', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Partying_ahe1f1.png')
Category.create(name: 'Education', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Education_zfphpm.png')
Category.create(name: 'Mindfulness', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638455816/Buddy/Mindfulness_mqzyhi.png')

puts "categories created"
puts "creating intentions"

Intention.create(name: 'Experience')
Intention.create(name: 'Party')
Intention.create(name: 'Meet People')
Intention.create(name: 'Listen to Music')
Intention.create(name: 'Explore')
Intention.create(name: 'Exercise')
Intention.create(name: 'Adventure')
Intention.create(name: 'Cultural')
Intention.create(name: 'Dating')
Intention.create(name: 'Educational')

puts "intentions created"
puts "creating events"

event_names.each_with_index do |event_name, index|
  event = Event.new(
    name: event_name,
    address: event_address[0],
    description: event_description[0],
    date: Faker::Date.forward(days: 10),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    category_id: rand(1..3)
  )
  file = URI.open(event_images[index])
  event.photo.attach(io: file, filename: "#{event}.jpg", content_type: 'image/jpg')
  event.save
end
puts "events created"

20.times do
  User.create(
    username: Faker::Internet.username,
    first_name: Faker::FunnyName.one_word_name,
    last_name: Faker::FunnyName.one_word_name,
    email: Faker::Internet.email,
    password: '123456',
    phone_number: '912345678',
    bio: Faker::Quote.jack_handey
  )

  puts "users created"
end

100.times do
  Booking.create(
    intention_description: Faker::Quote.jack_handey,
    event_id: rand(1..20),
    intention_id: rand(1..10),
    user_id: rand(1..20),
    created_at: Faker::Date.backward(days: 2),
    updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )

  puts "bookings created"
end
