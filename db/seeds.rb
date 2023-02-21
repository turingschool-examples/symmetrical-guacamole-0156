# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hotel.destroy_all
Room.destroy_all
Guest.destroy_all
GuestRoom.destroy_all

@hotel_1 = Hotel.create(name: "La Quinta", location: "Denver")
@hotel_2 = Hotel.create(name: "Hilton", location: "Seattle")

@room_1 = Room.create(rate: 400, suite: "Executive" )
@room_2 = Room.create(rate: 500, suite: "Terrace" )
@room_3 = Room.create(rate: 1000, suite: "Penthouse" )


# let!(:antonio) { @back_end.employees.create!(name: "Antonio", level: 3) }
# let!(:sandra) { @back_end.employees.create!(name: "Sandra", level: 2) }
# let!(:dimitri) { @back_end.employees.create!(name: "Dimitri", level: 1) }
# let!(:jeremiah) { @front_end.employees.create!(name: "Jeremiah", level: 1) }
# let!(:felix) { @front_end.employees.create!(name: "Felix", level: 3) }
# let!(:ronin) { @front_end.employees.create!(name: "Ronin", level: 2) }

@guest_1 = Guest.create(name: "Antonio", nights: 12)
@guest_2 = Guest.create(name: "Michael", nights: 3)
@guest_3 = Guest.create(name: "Keira", nights: 5)
@guest_4 = Guest.create(name: "Elizabeth", nights: 7)
