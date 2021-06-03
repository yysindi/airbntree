
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


require "open-uri"
require 'faker'

p 'Clearing database'
Booking.destroy_all
Treehouse.destroy_all
User.destroy_all
p 'creating users and treehouses'

user_1 = User.create(name: 'Jared', email: 'jared@test.com', owner: true, password: '123456')
user_2 = User.create(name: 'Keith', email: 'keith@test.com', owner: true, password: '123456')


name = ["The Purple Treehouse", "Treehouse With a View", "Magical Treehouse", "The Urban Jungle Treehouse", "My Perfect Treehouse", "Happy Place", "Where the Wukies Are"]
treehouse_photos =

['https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th3_axvlty.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th2_y35noh.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th_eezgo9.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th4_zxpqok.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th6_wb4s8u.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th5_gh9hon.jpg',
'https://res.cloudinary.com/ellamor/image/upload/w_500,c_scale/th7_flowym.jpg'
]

treehouse_filenames = ['th3_axvlty.jpg', 'th2_y35noh.jpg','th_eezgo9.jpg', 'th4_zxpqok.jpg', 'v1622646742/th6_wb4s8u.jpg', 'th5_gh9hon.jpg', '/th7_flowym.jpg']
treehouse_description = 
[
  'This detached treehouse is set in an enviable rural location and is ideal for couples, with cosy wood burner, private garden and fantastic walking routes.',
  'a stunning treehouse, nestled in the Hills on an 84 acre farm, offers a magical experience where you can reconnect with nature.',
  'Make social distancing a pleasure with this lovely streehouse. Set on a working farm with fantastic views of the Campsie, Fintry and Trossachs hills, this treehouse provides a quality stay',
  'Feel straight at home at our one of a kind treehouse, with a unique style and great views',
  'Charming and rustic tree house with 3 bedrooms and 2 bathrooms. Beautifully decorated and in the second floor of the tree.',
  'Get the wood-burner going inside, run yourself a bath out on the deck and soak in the peace of the treetops and the south west countryside.',
  'This is a little bit cosier than your normal nest in the trees. From the king-size bed to the sofa by the wood burner and the incredible bathtub out on the deck, Dabinett Treehouse is a chic, stylish haven.'
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

counter_two = 4

3.times do
  treehouse_file = URI.open("#{treehouse_photos[counter_two]}")
  treehouse = Treehouse.new(name: "#{name[counter_two]}", description: treehouse_description[counter_two], price: rand(70..300), location: Faker::Books::Dune.planet  )
  treehouse.user = user_2
  treehouse.photo.attach(io: treehouse_file, filename: "#{treehouse_filenames[counter_two]}", content_type: 'image/jpg')
  treehouse.save
  counter_two += 1
end

p 'Completed'