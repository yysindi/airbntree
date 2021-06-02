# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  oy_all


# p 'Initialising'
# user_1 = User.create(name: 'Jared', email: 'jared@test.com', owner: true, password: '123456')
# user_2 = User.create(name: 'Keith', email: 'keith@test.com', owner: false, password: '123456')

# 5.times do
#   treehouse = Treehouse.new(
#     name: Faker::Games::Zelda.character,
#     price: rand(1..100),
#     description: Faker::GreekPhilosophers.quote,
#     img: 'https://images.unsplash.com/photo-1587913696806-280ef35f1e19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
#     location: Faker::Books::Dune.planet
#     )
#   treehouse.user = user_1
#   treehouse.save!
#   booking = Booking.new(treehouse: treehouse, user: user_2, total_price: treehouse.price, check_in: Date.new(2022,2,3), check_out: Date.new(2022,4,3))
#   booking.save!
# end
# p 'Completed'
#  Character.create(name: 'Luke', movie: movies.first)
# p 'Clearing database'
# Booking.destroy_all
# Treehouse.destroy_all
# User.destr


require "open-uri"
require 'faker'

p 'Clearing database'
Booking.destroy_all
Treehouse.destroy_all
User.destroy_all
puts 'creating users and treehouses'

user_1 = User.create(name: 'Jared', email: 'jared@test.com', owner: true, password: '123456')
user_2 = User.create(name: 'Keith', email: 'keith@test.com', owner: false, password: '123456')


name = ["The Purple Treehouse", "Treehouse With a View", "Magical Treehouse", "The Urban Gungle Treehouse"]
treehouse_photos =
['https://res.cloudinary.com/ellamor/image/upload/v1622631346/th3_axvlty.jpg',
'https://res.cloudinary.com/ellamor/image/upload/v1622631346/th2_y35noh.jpg',
'https://res.cloudinary.com/ellamor/image/upload/v1622631346/th_eezgo9.jpg',
'https://res.cloudinary.com/ellamor/image/upload/v1622631346/th4_zxpqok.jpg',
]
treehouse_filenames = ['th3_axvlty.jpg', 'th2_y35noh.jpg','th_eezgo9.jpg', 'th4_zxpqok.jpg']
treehouse_description = 
[
  'This detached treehouse is set in an enviable rural location and is ideal for couples, with cosy wood burner, private garden and fantastic walking routes.',
  'a stunning treehouse, nestled in the Hills on an 84 acre farm, offers a magical experience where you can reconnect with nature.',
  'Make social distancing a pleasure with this lovely streehouse. Set on a working farm with fantastic views of the Campsie, Fintry and Trossachs hills, this treehouse provides a quality stay',
  'Feel straight at home at our one of a kind treehouse, with a unique style and great views'
]
counter = 0

4.times do
  treehouse_file = URI.open("#{treehouse_photos[counter]}")
  treehouse = Treehouse.new(name: "#{name[counter]}", description: treehouse_description[counter], price: rand(70..300), location: Faker::Books::Dune.planet  )
  treehouse.user = user_1
  treehouse.photo.attach(io: treehouse_file, filename: "#{treehouse_filenames[counter]}", content_type: 'image/jpg')
  treehouse.save
  counter += 1
end

p 'Completed'