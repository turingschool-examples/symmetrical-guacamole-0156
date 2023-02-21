class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms 
   has_many :guests, through: :guest_rooms
   validates_presence_of :suite
   validates_numericality_of :rate

   def guest_count 
      guests.count
   end
end