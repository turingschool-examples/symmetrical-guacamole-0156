class Room < ApplicationRecord
   belongs_to :hotel
	 has_many :room_guests
	 has_many :guests, through: :room_guests
	 
end