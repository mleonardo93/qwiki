# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
end

5.times do 
  User.create!(    
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    role: :premium
  )
end
users = User.all


50.times do
  Wiki.create!(
    title: Faker::Cat.breed,
    body: Faker::TheITCrowd.quote,
    user_id: users.sample.id
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"