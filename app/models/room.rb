class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms
   has_many :guests, through: :guest_rooms

   def hotel_name
     hotel.name
   end

   def number_of_guests
     guests.distinct.count
   end
end