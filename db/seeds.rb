# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying Membership'
Membership.destroy_all

puts 'Destroying Houses'
House.destroy_all

puts 'Destroying Users'
User.destroy_all




puts 'Creating Users'

# 16.times do |user|
#   user = User.create(
#     name: Faker::Name.name,
#     email: Faker::Internet.free_email,
#     password: "test123"
#   )
#   puts "Created #{user.name}"
# end

User.create!(name: 'Maria Nery', email: 'mnvnery@gmail.com', password: 'test123')
User.create!(name: 'Sini Ninkovic', email: 'sini.sn.ninkovic@gmail.com', password: 'test123')
User.create!(name: 'Branca Chiotte', email: 'brancachiotte@gmail.com', password: 'test123')
User.create!(name: 'Adriano Leite', email: 'adrianobleite@gmail.com', password: 'test123')
User.create!(name: 'Ricardo Araujo', email: 'ricardoaraujo@gmail.com', password: 'test123')
User.create!(name: 'Megan Bailey', email: 'meganbailey@gmail.com', password: 'test123')
User.create!(name: 'Richard Barrett', email: 'richardbarrett@gmail.com', password: 'test123')
User.create!(name: 'Leonor Brigas', email: 'leonorbrigas@gmail.com', password: 'test123')
User.create!(name: 'Ross Buddie', email: 'rossbuddie@gmail.com', password: 'test123')
User.create!(name: 'Eukleyv Cardoso', email: 'eukleyvcardoso@gmail.com', password: 'test123')
User.create!(name: 'Samira Eilinger', email: 'samiraeilinger@gmail.com', password: 'test123')
User.create!(name: 'Mariana Fialho', email: 'marianafialho@gmail.com', password: 'test123')
User.create!(name: 'Lara Mills', email: 'laramills@gmail.com', password: 'test123')
User.create!(name: 'Gabriel Neves', email: 'gabrielneves@gmail.com', password: 'test123')
User.create!(name: 'Florian Ott', email: 'florianott@gmail.com', password: 'test123')
User.create!(name: 'Tiago Palhoça', email: 'tiagopalhoca@gmail.com', password: 'test123')
User.create!(name: 'Barbara Rebelo', email: 'barbararebelo@gmail.com', password: 'test123')
User.create!(name: 'Céline Stalder', email: 'celinestalder@gmail.com', password: 'test123')
User.create!(name: 'Raffaele Viggiani', email: 'raffaeleviggiani@gmail.com', password: 'test123')
User.create!(name: 'Jake Xiao', email: 'sifanxiao@gmail.com', password: 'test123')



puts 'Creating Houses'


House.create!(name: 'House Stark', email: 'stark@gmail.com', house_balance: '0')
House.create!(name: 'House Lannister', email: 'lannister@gmail.com', house_balance: '0')
House.create!(name: 'House Targaryen', email: 'targaryen@gmail.com', house_balance: '0')
House.create!(name: 'House Tyrell', email: 'tyrell@gmail.com', house_balance: '0')
House.create!(name: 'House Bolton', email: 'bolton@gmail.com', house_balance: '0')
House.create!(name: 'House Tully', email: 'tully@gmail.com', house_balance: '0')
House.create!(name: 'House Martell', email: 'martell@gmail.com', house_balance: '0')
House.create!(name: 'House Greyjoy', email: 'greyjoy@gmail.com', house_balance: '0')
House.create!(name: 'House Baratheon', email: 'baratheon@gmail.com', house_balance: '0')

# 4.times do |house|
#   house = House.create(
#     name: Faker::Movies::HarryPotter.location,
#     email: Faker::Internet.free_email,
#     house_balance: 0
#   )
#   puts "Created #{house.name}"
# end

puts 'Creating Memberships'

Membership.create!(user: User.find_by(name: 'Maria Nery'), house: House.find_by(name: 'House Stark'))
Membership.create!(user: User.find_by(name: 'Sini Ninkovic'), house: House.find_by(name: 'House Stark'))
Membership.create!(user: User.find_by(name: 'Branca Chiotte'), house: House.find_by(name: 'House Stark'))
Membership.create!(user: User.find_by(name: 'Adriano Leite'), house: House.find_by(name: 'House Stark'))

Membership.create!(user: User.find_by(name: 'Adriano Leite'), house: House.find_by(name: 'House Lannister'))
Membership.create!(user: User.find_by(name: 'Ricardo Araujo'), house: House.find_by(name: 'House Lannister'))
Membership.create!(user: User.find_by(name: 'Megan Bailey'), house: House.find_by(name: 'House Lannister'))

Membership.create!(user: User.find_by(name: 'Maria Nery'), house: House.find_by(name: 'House Targaryen'))
Membership.create!(user: User.find_by(name: 'Richard Barrett'), house: House.find_by(name: 'House Targaryen'))
Membership.create!(user: User.find_by(name: 'Leonor Brigas'), house: House.find_by(name: 'House Targaryen'))
Membership.create!(user: User.find_by(name: 'Ross Buddie'), house: House.find_by(name: 'House Targaryen'))

Membership.create!(user: User.find_by(name: 'Sini Ninkovic'), house: House.find_by(name: 'House Tyrell'))
Membership.create!(user: User.find_by(name: 'Eukleyv Cardoso'), house: House.find_by(name: 'House Tyrell'))
Membership.create!(user: User.find_by(name: 'Samira Eilinger'), house: House.find_by(name: 'House Tyrell'))
Membership.create!(user: User.find_by(name: 'Mariana Fialho'), house: House.find_by(name: 'House Tyrell'))

Membership.create!(user: User.find_by(name: 'Lara Mills'), house: House.find_by(name: 'House Bolton'))
Membership.create!(user: User.find_by(name: 'Florian Ott'), house: House.find_by(name: 'House Bolton'))
Membership.create!(user: User.find_by(name: 'Tiago Palhoça'), house: House.find_by(name: 'House Bolton'))
Membership.create!(user: User.find_by(name: 'Barbara Rebelo'), house: House.find_by(name: 'House Bolton'))

Membership.create!(user: User.find_by(name: 'Céline Stalder'), house: House.find_by(name: 'House Tully'))
Membership.create!(user: User.find_by(name: 'Raffaele Viggiani'), house: House.find_by(name: 'House Tully'))
Membership.create!(user: User.find_by(name: 'Jake Xiao'), house: House.find_by(name: 'House Tully'))
Membership.create!(user: User.find_by(name: 'Gabriel Neves'), house: House.find_by(name: 'House Tully'))

Membership.create!(user: User.find_by(name: 'Branca Chiotte'), house: House.find_by(name: 'House Martell'))
Membership.create!(user: User.find_by(name: 'Eukleyv Cardoso'), house: House.find_by(name: 'House Martell'))
Membership.create!(user: User.find_by(name: 'Raffaele Viggiani'), house: House.find_by(name: 'House Martell'))
Membership.create!(user: User.find_by(name: 'Samira Eilinger'), house: House.find_by(name: 'House Martell'))

Membership.create!(user: User.find_by(name: 'Richard Barrett'), house: House.find_by(name: 'House Greyjoy'))
Membership.create!(user: User.find_by(name: 'Ricardo Araujo'), house: House.find_by(name: 'House Greyjoy'))
Membership.create!(user: User.find_by(name: 'Mariana Fialho'), house: House.find_by(name: 'House Greyjoy'))
Membership.create!(user: User.find_by(name: 'Jake Xiao'), house: House.find_by(name: 'House Greyjoy'))
Membership.create!(user: User.find_by(name: 'Lara Mills'), house: House.find_by(name: 'House Greyjoy'))

Membership.create!(user: User.find_by(name: 'Gabriel Neves'), house: House.find_by(name: 'House Baratheon'))
Membership.create!(user: User.find_by(name: 'Maria Nery'), house: House.find_by(name: 'House Baratheon'))
Membership.create!(user: User.find_by(name: 'Branca Chiotte'), house: House.find_by(name: 'House Baratheon'))


# 16.times do |membership|
#   membership = Membership.create(
#     user_id: User.ids.sample,
#     house_id: House.ids.sample
#   )
# end
puts "Created membership"

puts "Finished!"
