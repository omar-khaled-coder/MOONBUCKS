# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts " / / creating Admin \ \ "
lily = User.create!(
  first_name: "Lily",
  last_name: "Smith",
  identification_number: "2951018130458",
  address: "456 Admin St",
  contact_number: "555-5678",
  email: "lily@gmail.com",
  password: "123456"
)
puts 'Admin created from user with id = 1 >> email: lily@gmail.com <<, >> password: 123456 << '

puts '/ / creating users \ \ '
omar = User.create!(
  first_name: "Omar",
  last_name: "abdrabuo",
  identification_number: '29610181400458',
  address: '90 n st',
  contact_number: '+201129570468',
  email: 'omar22@gmail.com',
  password: '123456'
)
omar.photo.attach(io: File.open(URI.open('https://res.cloudinary.com/drt2m0vmp/image/upload/v1692402276/development/s0tm50wu1ezrh63mkq5bolpgdfxf.jpg')), filename: 'user omar.png', content_type: 'image/png')
puts '/ / Users created \ \ '

puts "creating Admins"
Admin.create!(
  first_name: "Admin",
  last_name: "User",
  identification_number: "2951018130458",
  address: "456 Admin St",
  contact_number: "555-5678",
  email: "admin@example.com",
  # password_confirmation: "password"
  user: lily
)
puts "created admin 1"

puts ' / / creating products \ \ '
ps5 = Product.create!(
  name: 'playstation 5',
  rating: 5.0,
  description: 'best gaming consle in the world',
  short_description: 'play with the best',
  price: '500',
  user: lily
)
ps5.photos.attach(io: File.open(URI.open('https://res.cloudinary.com/drt2m0vmp/image/upload/v1692071057/development/j6z8gl74ptqn9ji2l74xgygj7oye.jpg')), filename: 'ps5.png', content_type: 'image/png')

toaster = Product.create!(
  name: 'Mince toaster',
  rating: 5.0,
  description: 'best gearmen toaster',
  short_description: 'toaster of the weak',
  price: '150',
  user: lily
)
toaster.photos.attach(io: File.open(URI.open('https://res.cloudinary.com/drt2m0vmp/image/upload/v1692051870/development/vdo2cqjeloanpgj3ebf38i6g8l7w.jpg')), filename: 'toaster.png', content_type: 'image/png')

jbl = Product.create!(
  name: 'JBL partybox',
  rating: 5.0,
  description: 'best party in the town',
  short_description: 'your party is here',
  price: '1000',
  user: lily
)
jbl.photos.attach(io: File.open(URI.open('https://res.cloudinary.com/drt2m0vmp/image/upload/v1692422229/71isiSO138L_da2aub.jpg')), filename: 'jbl.png', content_type: 'image/png')

xbox = Product.create!(
  name: 'XBOX series x',
  rating: 5.0,
  description: 'best exlusive games',
  short_description: 'microsofte game consle',
  price: '400',
  user: lily
)
xbox.photos.attach(io: File.open(URI.open('https://res.cloudinary.com/drt2m0vmp/image/upload/v1692422058/f085c120-d3d5-4424-8b70-eb25deaa326e_idixtt.png')), filename: 'xbox.png', content_type: 'image/png')
puts '/ / products created \ \ '
