# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all
  Cat.destroy_all

  # Wizards
  al = User.create!(username: 'al', password_digest: BCrypt::Password.create("password"), session_token: "1")
  bob = User.create!(username: 'bob', password_digest: BCrypt::Password.create("password"), session_token: "2")
  carol = User.create!(username: 'carol', password_digest: BCrypt::Password.create("password"), session_token: "3")
  dot = User.create!(username: "dot", password_digest: BCrypt::Password.create("password"), session_token: "4")

  elle = Cat.create!(birth_date: 1/1/11, color: 'white', name: 'elle', sex:'F', description: "a cute cat" )
  fred = Cat.create!(birth_date: 1/1/11, color: 'white', name: 'fred', sex:'M', description: "not a cute cat" )
george = Cat.create!(birth_date: 1/1/11, color: 'white', name: 'george', sex:'F', description: "of the jungle" )
  hairy = Cat.create!(birth_date: 1/1/11, color: 'white', name: 'hairy', sex:'M', description: "is very" )
  
  
end