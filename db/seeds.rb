# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mtn_1 = Hotel.create!(name: "Sun Valley Main", location: "North Slopes")
mtn_2 = Hotel.create!(name: "Sun Valley Private", location: "West Slopes")
tori = Guest.create!(name: "Tori", nights_stayed: "7")
penthouse = tori.rooms.create!(rate: 9998, suite: "Penthouse", hotel_id: mtn_1.id)
cabin = tori.rooms.create!(rate: 8798, suite: "Private Cabin", hotel_id: mtn_2.id)
