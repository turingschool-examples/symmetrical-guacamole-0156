class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms
   has_many :guests, through: :guest_rooms

   def guest_count
    # require 'pry'; binding.pry
    guests.distinct.count
   end
end