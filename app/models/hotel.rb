class Hotel < ApplicationRecord
   has_many :rooms

   def guests
      Guest.joins(:guest_rooms).joins(:rooms).where("rooms.hotel_id = #{self.id}")
   end
end