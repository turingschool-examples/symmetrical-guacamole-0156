# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
winterpark = Hotel.create!(name: 'Winter Park Hotel', location: 'Winter Park')

andra = Guest.create!(name: "Andra", nights: 4)

presedential = echo.rooms.create!(rate: 125, suite: "Presedential")
b27 = winterpark.rooms.create!(rate: 60, suite: "b27")
e42 = winterpark.rooms.create!(rate: 80, suite: "e42")