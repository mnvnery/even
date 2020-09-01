# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying Users'
User.destroy_all

puts 'Destroying Houses'
House.destroy_all

puts 'Creating Users'

16.times do |user|
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.free_email,
    password: "test123"
  )
  puts "Created #{user.name}"
end

puts 'Creating Houses'

4.times do |house|
  house = House.create(
    name: Faker::Movies::HarryPotter.location,
    email: Faker::Internet.free_email,
    house_balance: 0
  )
  puts "Created #{house.name}"
end

puts 'Creating Memberships'

16.times do |membership|
  membership = Membership.create(
    user_id: User.ids.sample,
    house_id: House.ids.sample
  )
end
puts "Created membership"

puts "Finished!"
