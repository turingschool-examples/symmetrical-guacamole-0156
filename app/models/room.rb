class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms
   has_many :guests, through: :guest_rooms

   def hotel_name
      hotel.name
   end

   def guests_stayed
      guests.count
   end
end