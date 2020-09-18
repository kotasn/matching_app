# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails db:seed　で実行

10.times do |n| #10件シードデータを作成するということ。
  name = Faker::Movies::StarWars.character
  email = Faker::Internet.email
  password = "password"
  User.create!(username: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end