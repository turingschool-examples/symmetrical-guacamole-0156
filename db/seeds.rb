# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@echo = Hotel.create!(name: 'Echo Mountain Inn', location: 'Echo Mountain')
@dt = Hotel.create!(name: 'Double Tree', location: 'Loveland')
@room1 = @echo.rooms.create!(rate: 125, suite: "Presidential")
@room2 = @echo.rooms.create!(rate: 100, suite: "Standard King")
@room3 = @echo.rooms.create!(rate: 250, suite: "Honeymoon")
@room4 = @dt.rooms.create!(rate: 125, suite: "Presidential")
@room5 = @dt.rooms.create!(rate: 100, suite: "Standard King")
@room6 = @dt.rooms.create!(rate: 250, suite: "Honeymoon")
@mike = Guest.create!(name: 'Mike Smith', nights: 3)
@matt = Guest.create!(name: 'Matt Smith', nights: 2)
GuestRoom.create!(guest:@mike, room: @room1)
GuestRoom.create!(guest:@mike, room: @room2)
GuestRoom.create!(guest:@matt, room: @room1)
GuestRoom.create!(guest:@matt, room: @room2)
GuestRoom.create!(guest:@mike, room: @room2)
GuestRoom.create!(guest:@mike, room: @room1)