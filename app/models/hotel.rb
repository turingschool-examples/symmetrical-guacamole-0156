class Hotel < ApplicationRecord
   has_many :rooms
	 has_many :guests, through: :rooms

	 def unique_guests
		guests.distinct
	 end
end