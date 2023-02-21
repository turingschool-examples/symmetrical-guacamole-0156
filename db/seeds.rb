# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@hotel_1 = Hotel.create!(name: 'Echo Mountain Inn', city: 'Echo Mountain')
@hotel_2 = Hotel.create!(name: 'Four Seasons', city: 'Vail')
@hotel_3 = Hotel.create!(name: 'Ritz', city: 'Denver')

@guest_1 = Guest.create!(name: 'Charlize Theron', nights: 3)
@guest_2 = Guest.create!(name: 'Elle Majors', nights: 5 )
@guest_3 = Guest.create!(name: 'Avery Bechtel', nights: 7)
@guest_4 = Guest.create!(name: 'Tim Cook', nights: 2)

@room_1 = @guest_1.room.create!(rate: 125, suite: 'Presidential', hotel_id: @hotel_1.id)
@room_2 = @guest_2.room.create!(rate: 100, suite: 'Premium', hotel_id: @hotel_1.id)
@room_3 = @guest_3.room.create!(rate: 300, suite: 'Executive', hotel_id: @hotel_2.id)
@room_4 = @guest_4.room.create!(rate: 600, suite: 'VIP', hotel_id: @hotel_3.id)

@hotel_rooms1 = HotelRoom.create!(hotel: @hotel_1 , room: @room_1)
@hotel_rooms2 = HotelRoom.create!(hotel: @hotel_2, room: @room_2)
@hotel_rooms3 = HotelRoom.create!(hotel: @hotel_3, room: @room_3)