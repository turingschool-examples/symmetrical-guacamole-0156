# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hotel = Hotel.create!(name: "The Hythe", location: "Vail, CO")

@junior_suite = Room.create!(suite: "Junior", rate: 250, hotel: hotel)
@penthouse = Room.create!(suite: "Penthouse", rate: 1000, hotel: hotel)
@standard_room = Room.create!(suite: "Standard Room", rate: 125, hotel: hotel)

@adam = Guest.create!(name: "Adam", nights: 2)
@brie = Guest.create!(name: "Brie", nights: 5)

RoomGuest.create!(guest: @adam, room: @junior_suite)
RoomGuest.create!(guest: @adam, room: @standard_room)
RoomGuest.create!(guest: @brie, room: @penthouse)