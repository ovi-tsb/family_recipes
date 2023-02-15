# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user5 = AdminUser.create!(email: "admin@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Gogu",
                last_name: "Pilosu"
                )

puts "1 Admin User created"

@user1 = User.create!(email: "1@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Nelu",
                last_name: "Nelosu"
                )
@user2 = User.create!(email: "2@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Marius",
                last_name: "Moga"
                )
@user3 = User.create!(email: "3@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Paul",
                last_name: "Nogu"
                )
@user4 = User.create!(email: "4@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Pelu",
                last_name: "Melu"
                )
@user5 = User.create!(email: "gigi@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Bugu",
                last_name: "Nugu"
                )
@user6 = User.create!(email: "tom@yahoo.com", 
                password: "123456", 
                password_confirmation: "123456",
                first_name: "Deli",
                last_name: "Meli"
                )
puts "6 User created"