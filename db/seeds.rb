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

Message.destroy_all
ChatroomUser.destroy_all
Chatroom.destroy_all
Request.destroy_all
Booking.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all
Intention.destroy_all
Category.destroy_all

puts "destroyed all"

user_avatars = ["https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_female10_beieia.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_female9_xvqbne.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533370/Buddy/Profile_avatar_male1_llyxze.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533370/Buddy/Profile_avatar_female1_pmutbd.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_male4_ffcvhe.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_female4_zsa1ym.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_female5_ubhc3o.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_male2_jastka.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_female2_zdsxkz.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male6_pqcwdf.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_male5_wq9fch.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_female3_zhofb4.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_male3_lsc4gz.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female8_xdajqi.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female6_go3qzc.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female7_uibzaw.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male9_h8dktd.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male7_txayqs.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male10_z4ihxh.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_male8_dapmcn.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_female9_xvqbne.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_female3_zhofb4.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533369/Buddy/Profile_avatar_male3_lsc4gz.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female8_xdajqi.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female6_go3qzc.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_female7_uibzaw.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male9_h8dktd.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male7_txayqs.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533368/Buddy/Profile_avatar_male10_z4ihxh.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_male8_dapmcn.png",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638533367/Buddy/Profile_avatar_female9_xvqbne.png"]

event_images = ["https://res.cloudinary.com/duw0kzy1b/image/upload/v1638964847/Buddy/volleyball_j7stlq.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638976395/Buddy/bruce-mars-gJtDg6WfMlQ-unsplash_ytqgsf.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963794/Buddy/hiking_w9khn0.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638464619/Buddy/Surf_lesson_fgqhrq.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638964098/Buddy/monchique_s0tsl7.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638964419/Buddy/art-workshop_d8rjo3.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465646/Buddy/Movie_q9kksh.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963664/Buddy/drawing_ftny0y.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638465867/Buddy/Improv_mvtkal.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638974926/Buddy/alocalsguidetolisbonstreetart-816x612_g9rypx.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638974410/Buddy/ceviche_958x540_dp1e07.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638908363/Buddy/Disco_xxjea0.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638964188/Buddy/mercado_natal_avc6qb.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638975034/Buddy/mw-1240_pzkzey.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638910269/Buddy/alabamagospelchoir2021_hotsb4.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638910517/Buddy/tb_a4rr72.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638910732/Buddy/comic-con-portugal-20-cover_kpadmq.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638911242/Buddy/corrida-sao-silvestre-de-lisboa-21-cover_sqnefv.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638911143/Buddy/royal-palace-2021-22_wnhqyz.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1638976296/Buddy/bacalhau_ulmnpr.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1639134055/Buddy/wedding_crashing_wrpkvc.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1639133571/Buddy/brooding_sjpq9p.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1639134959/Buddy/carl-raw-m3hn2Kn5Bns-unsplash_ekbrnu.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1639051869/Buddy/buddy_landing2_bucbn8.jpg",
                "https://res.cloudinary.com/duw0kzy1b/image/upload/v1639051655/Buddy/Buddy_landing_bupobm.jpg"]

event_names = { "Volley and beer at Campo grande garden" => "Sports",
                "Pilates at Work In studio" => "Mindfulness",
                "Hiking on the Enchanted Serra de Sintra" => "Outdoors",
                "Let's go surfing!" => "Sports",
                "Hiking - SOUTH side slopes" => "Travel",
                "Alternative Portrait Workshop" => "Education",
                "Film Club: One Flew Over the Cuckoo’s Nest" => "Art",
                "Drawing Doodling zoom sessions" => "Art",
                "Improv workshop- short and long form" => "Art",
                "Street Art Walk & City Game" => "Outdoors",
                "Workshop - CEVICHE" => "Dining",
                "LUXXXMAS @Lux Frágil" => "Partying",
                "Alvalade Christmas Market" => "Outdoors",
                "SoundFlower Fest" => "Music",
                "Alabama Gospel Choir" => "Music",
                "Tiago Bettencourt - Live" => "Music",
                "Comic-Con Portugal'21" => "Gaming",
                "São Silvestre de Lisboa Race'21" => "Sports",
                "Royal Palace 2021 - New Year's Eve" => "Partying",
                "Tasca da Esquina" => "Dining",
                "Wedding crashing" => "Partying",
                "Brooding on the beach" => "Mindfulness",
                "Arcade Gaming is back" => "Gaming",
                "Rise of the grill-master" => "Dining",
                "Road-trip to nowhere" => "Travel" }

event_address = ["Lumiar, Lisbon", "Cascais, Portugal", "Sintra, Portugal", "Carcavelos, Portugal", "Monsanto, Portugal",
                 "Bairro Alto, Lisbon", "Laranjeiras, Lisbon", "Beato, Lisbon", "Alverca, Portugal", "Cais do Sodre, Lisbon",
                 "Mercado da Ribeira, Lisbon", "Av Inf D Henrique, Lisbon", "Alvalade, Lisbon", "Lx Factory, Lisbon",
                 "Coliseu de Lisboa, Lisbon", "Coliseu de Lisboa, Lisbon", "Altice Arena, Lisbon", "Avenida da Liberdade, Lisbon",
                 "Parque Eduardo VII, Lisbon", "Rua Domingos Sequeira, Lisbon", "Lisbon, Portugal", "Carcavelos, Lisbon",
                 "Bairro Alto, Lisbon", "Cascais, Portugal", "Lisbon, Portugal"]

event_description = ["We'll bring our two or three nets to play volleyball at campo grande garden. Theres a cheap tapas restaurant nearby if you want to eat /drink something after.",
                     "We are inviting you to join our Pilates mat workout in a beautiful place at 'Work In studio'",
                     "This is a sweet & easy hike in the forested area of southern Serra de Sintra. We'll start at the charming village of Malveira da Serra, climb to Penedo da Roçada's to enjoy the views",
                     "SURF and EXPERIENCE for First-timers and advanced. We have lessons at 10 or 10:30am, 12 or 12:30pm and 2 or 2:30pm on weekends. 10 or 10:30 during the week.",
                     "This is an international group for lovers of walking, who want to be in the great outdoors, and discovering more of the Monsanto park.",
                     "Alternative portrait workshop is a good opportunity to free your mind, try different approach in painting and to develop your creativity",
                     "What is the drive behind the actions of a cruel teenager or an obsessive voyeur? Can nurture overwrite nature? How can we cope with the lack of remorse? The films of this cycle explore the absence of empathy in different social situations..",
                     "Weekly Online Drawing Doodling sessions Fridays 8pm - 9pm Various drawing / doodling activities",
                     "Improv drops you into that wondrous world of high-energy, immediate, person-to-person interaction. The event will be held in Room 4.02 - on the 4th floor in the main building, there is an elevator available. Bring yourself and your positive attitude ready to shake off your day and wear clothes that are easy to move around in.",
                     "Discover Lisbon while meeting new people in town and exploring a unique street art walk lead by riddles & tips",
                     "From the result of various cultural exchanges over time, Peruvian cuisine was born, unique in the world. In this workshop, come learn more about the flavors, origins and tradition of this cuisine. Learn from chef Miguel Mesquita how to make a classic ceviche and a Causa Limeña.",
                     "Lisbon's best club, provides the best christmas party in town, this time with a grand Christmassy production to keep your body moving for hours on end. Be whisked away to a frosty world of arctic animals, igloos and snow covered forests to get into the festive spirit, all soundtracked to a huge line-up of dance legends and new talent alike. ",
                     "It has been customary to see countless wooden houses on Avenida da Igreja when December arrives. This year is not an exception: the famous Alvalade Christmas Market is back with stalls, crafts and food",
                     "Capitão Fausto no SoundFlower Fest takes place at Lx Factory, in Lisbon. The event, which was supposed to take place in Valada in September, was canceled and rescheduled because of the pandemic. Thus was born the festival that is being presented as a Christmas edition.",
                     "Alabama Gospel Choir give us a journey to the roots interpreting all the Gospel classics in a unique register that combines euphoria and strength with a more spiritual essence.",
                     "Live and in colour, Bettencourt presents a project that was born digitally. “Tiago na Toca” emerged during the first lockdown and was revealed every week when he opened the doors of his home to the public.",
                     "During the four days, there will be national and international artists from Cinema, Television, Comics, Literature, Cosplay, Anime, Manga, Videogames, Music and Youtube that will be present in panels",
                     "Usually the starting point is on Avenida da Liberdade, the race has a distance of ten kilometres, but kids and grownups can run or walk in the many races categories.",
                     "For the 7th year in a row we made an appointment on the 31st of December for a unique night in a historic and centennial place, with red carpet, an audiovisual show during the countdown and with the performance of a group of nationally renowned artists.",
                     "A pleasant atmosphere to share our modern cuisine with traditional touch!",
                     "Get the ultimate prize of civilised debauchery, going back hundreds of years of tradition in making yourself a guest at a stranger´s most special day!",
                     "Mindfully and silently join a group of strangers in a brooding session, the joy of assertive brooding is a skill and meditation technique very well regarded in northern Europe",
                     "Arcade gaming is making a comeback! Since the early eighties during the dawn of arcade gaming, arcade game have taken many turns but never really went away. Come celebrate the heritage of arcades.",
                     "Come join us in this grilling competition, and help crown the ultimate grill-master. No one should leave this event sober, so make arrangements accordingly. Drive safe!",
                     "Put your safety in the hands of a complete stranger as you go on a road-trip without destination. Who knows what will happen? Life is a mistery worth not taking seriously."]

event_dates = [["Sat, 11 Dec 2021", "15:30"],
               ["Mon, 13 Dec 2021", "11:00"],
               ["Wed, 15 Dec 2021", "10:00"],
               ["Tue, 14 Dec 2021", "10:00"],
               ["Sun, 12 Dec 2021", "09:00"],
               ["Thu, 16 Dec 2021", "10:00"],
               ["Sat, 18 Dec 2021", "20:30"],
               ["Fri, 17 Dec 2021", "18:00"],
               ["Fri, 23 Dec 2021", "18:00"],
               ["Tue, 21 Dec 2021", "10:00"],
               ["Fri, 10 Dec 2021", "19:00"],
               ["Wed, 22 Dec 2021", "23:00"],
               ["Sun, 19 Dec 2021", "10:00"],
               ["Thu, 25 Dec 2021", "22:00"],
               ["Fri, 24 Dec 2021", "12:00"],
               ["Mon, 20 Dec 2021", "20:00"],
               ["Sun, 12 Dec 2021", "12:00"],
               ["Mon, 27 Dec 2021", "10:00"],
               ["Fri, 31 Dec 2021", "22:00"],
               ["Tue, 28 Dec 2021", "20:00"],
               ["Tue, 02 Jan 2021", "20:00"],
               ["Fri, 24 Jan 2021", "12:00"],
               ["Wed, 22 Jan 2021", "20:00"],
               ["Sun, 19 Jan 2021", "10:00"],
               ["Tue, 20 Jan 2021", "12:00"]]

puts "creating categories"

categories = [
  Category.create!(name: 'Outdoors', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963375/Buddy/outdoors_2_bwssx5.png'),
  Category.create!(name: 'Sports', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963374/Buddy/sports_2_cw7lhy.png'),
  Category.create!(name: 'Music', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963375/Buddy/live-music_2_zegtf7.png'),
  Category.create!(name: 'Dining', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963375/Buddy/dining_2_gykkzc.png'),
  Category.create!(name: 'Travel', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963375/Buddy/travel_b2myqz.png'),
  Category.create!(name: 'Art', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963374/Buddy/museum_2_eh06ka.png'),
  Category.create!(name: 'Gaming', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963374/Buddy/gaming_2_mogebo.png'),
  Category.create!(name: 'Partying', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963374/Buddy/partying_ffsc0z.png'),
  Category.create!(name: 'Education', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963374/Buddy/education_2_iihrfw.png'),
  Category.create!(name: 'Mindfulness', photo: 'https://res.cloudinary.com/duw0kzy1b/image/upload/v1638963375/Buddy/mindfulness_2_cyr9rk.png')
]

puts "categories created"
puts "creating intentions"

Intention.create!(name: 'Experience')
Intention.create!(name: 'Party')
Intention.create!(name: 'Meet People')
Intention.create!(name: 'Listen to Music')
Intention.create!(name: 'Explore')
Intention.create!(name: 'Exercise')
Intention.create!(name: 'Adventure')
Intention.create!(name: 'Cultural')
Intention.create!(name: 'Dating')
Intention.create!(name: 'Educational')

puts "intentions created"
puts "creating events"

event_names.each_with_index do |event_name, index|
  event = Event.new(
    name: event_name[0],
    address: event_address[index],
    description: event_description[index],
    date: Date.parse(event_dates[index][0]),
    time: event_dates[index][1],
    category: Category.find_by(name: event_name[1]),
    start_time: Faker::Time.between(from: DateTime.now - 1, to: Date.today + 10)
  )
  file = URI.open(event_images[index])
  event.photo.attach(io: file, filename: "#{event_name}.jpg", content_type: 'image/jpg')
  event.save!
end
puts "real events created"

i = 0

30.times do
  username = Faker::Internet.username
  user = User.create!(
    email: "#{username}@mail.com",
    password: '123456'
  )
  profile = Profile.new(
    username: username,
    first_name: Faker::Name.name.split(" ")[0],
    last_name: Faker::Name.name.split(" ")[1],
    phone_number: '912345678',
    bio: Faker::Quote.jack_handey,
    user: user
  )
  (i + 1)
  file = URI.open(user_avatars[i])
  profile.photo.attach(io: file, filename: "#{profile.username}.png", content_type: 'image/png')
  profile.save!
  i += 1
  puts "users created"
  puts "profiles created"
end

Event.all.each do |event|
  User.all.sample(rand(3..6)).each do |user|
    Booking.create!(
      intention_description: Faker::Quote.jack_handey,
      event: event,
      intention: Intention.all.sample,
      user: user,
      created_at: Faker::Date.backward(days: 2),
      updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )

    puts "bookings created"
  end
end
