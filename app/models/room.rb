class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms
   has_many :guests, through: :guest_rooms

   def guest_count
      self.guests.count
   end

   def guest_names
      self.guests.pluck(:name)
   end
end