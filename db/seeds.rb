# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email 
  password  = Faker::Internet.password(min_length: 8) 
  User.create!(name: name, email: email, password: password)
end


User.all.each do |user| 
  title = Faker::Lorem.word
  body  = Faker::Lorem.paragraphs(number: 1) 
  user.posts.create!(title: title, body: body)
end

