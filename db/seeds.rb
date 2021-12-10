# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
require 'faker'

event1 = Event.new(
    name: "Searching for Satoshi Nakamoto",
    address: "Cascais, Lisbon",
    description: "The myth is real! We who believe the creator still walks among us, let´s pull our resources together and scout for clues of the creator´s whereabouts. In my neighborhood...",
    date: "Tue, 12 Jan 2021",
    time: "10:00",
    category: "Mine",
    start_time: "2021-01-12 10:00:00.000000000 +0000"
  )
  file = URI.open("https://unsplash.com/photos/T69h1_YfR-w")
  event1.photo.attach(io: file, filename: "search.jpg", content_type: 'image/jpg')
  event1.save!

event2 = Event.new(
    name: "Let's get matching tattoos",
    address: "Bairro Alto, Lisbon",
    description: "The idea is to get drunk and choose matching tatoos, while sipping ginjinhas ! lets celebrate the accomplishments of many generations of bohemian living.",
    date: "Tue, 14 Jan 2021",
    time: "15:00",
    category: "Mine",
    start_time: "2021-01-14 15:00:00.000000000 +0000"
  )
  file = URI.open("https://unsplash.com/photos/52Kf36w124Y")
  event2.photo.attach(io: file, filename: "search2.jpg", content_type: 'image/jpg')
  event2.save!


event3 = Event.new(
    name: "Mountain-biking around the seven hills of Lisbon",
    address: "Lisbon, Portugal",
    description: "We propose to attack the gnarly hills of Lisbon in an extreme urban mountain-biking mad-dash. The survivors will get a free pastel de nata.",
    date: "Tue, 16 Jan 2021",
    time: "16:00",
    category: "Mine",
    start_time: "2021-01-16 16:00:00.000000000 +0000"
  )
  file = URI.open("https://unsplash.com/photos/KHqAv9qQJD8")
  event3.photo.attach(io: file, filename: "search3.jpg", content_type: 'image/jpg')
  event3.save!
