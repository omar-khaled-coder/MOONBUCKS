# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating user"
lily = User.create!({
  first_name: "Lily",
  last_name: "Smith",
  identification_number: "2951018130458",
  address: "456 Admin St",
  contact_number: "555-5678",
  email: "lily@gmail.com",
  password: "123456"
})

puts "creating Admins"

admin1 = Admin.create!(
  first_name: "Admin",
  last_name: "User",
  identification_number: "2951018130458",
  address: "456 Admin St",
  contact_number: "555-5678",
  email: "admin@example.com",
  # password_confirmation: "password"
  user: lily
)

puts "created designer 1"
