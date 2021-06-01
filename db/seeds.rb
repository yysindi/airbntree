# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Clearing database'
Booking.destroy_all
Treehouse.destroy_all
User.destroy_all


p 'Initialising'
user_1 = User.create(name: 'Jared', email: 'jared@test.com', owner: true, password: '123456')
user_2 = User.create(name: 'Keith', email: 'keith@test.com', owner: false, password: '123456')

5.times do
  treehouse = Treehouse.new(
    name: Faker::Games::Zelda.character,
    price: rand(1..100),
    description: Faker::GreekPhilosophers.quote,
    img: 'https://images.unsplash.com/photo-1587913696806-280ef35f1e19?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
    location: Faker::Books::Dune.planet
    )
  treehouse.user = user_1
  treehouse.save!
  Booking.new(treehouse: treehouse, user: user_2, total_price: treehouse.price, check_in: Date.new(2022,2,3), check_out: Date.new(2022,4,3))
end
p 'Completed'
