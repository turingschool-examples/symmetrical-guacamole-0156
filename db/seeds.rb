# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@guest1 = Guest.create!(name: 'Brad Dunlap', nights: 5)
		@guest2 = Guest.create!(name: 'Adrian Fierro', nights: 4)
		@guest3 = Guest.create!(name: 'Aaron McKendry', nights: 3)
		@hotel = Hotel.create!(name: 'Sleepy Inn', location: "Pittsburgh")
		@hotel2 = Hotel.create!(name: 'Hells Hotel', location: "Detroit")
		@pres = @hotel.rooms.create!(rate: 200, suite: "Presidential")
		@pent = @hotel.rooms.create!(rate: 250, suite: "Penthouse")
		@suite = @hotel.rooms.create!(rate: 250, suite: "Suite")
		@lava = @hotel2.rooms.create!(rate: 666, suite: "Lava Pit")
		RoomGuest.create!(guest: @guest1, room: @pres)
		RoomGuest.create!(guest: @guest1, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @pent)
		RoomGuest.create!(guest: @guest2, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @suite)
		RoomGuest.create!(guest: @guest3, room: @lava)