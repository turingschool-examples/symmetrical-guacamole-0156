class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms, dependent: :destroy
   has_many :guests, through: :guest_rooms

   def hotel_name
      Hotel.find(hotel_id).name
  end

  def guest_count
    guests.distinct.count
  end
end