class Room < ApplicationRecord
  belongs_to :hotel
  has_many :guest_rooms
  has_many :guests, through: :guest_rooms 
  
  def number_of_guests
    self.guests.distinct.count
  end
end