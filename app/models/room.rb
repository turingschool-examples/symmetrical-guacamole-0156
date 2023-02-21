class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :guest
  has_many :hotel_rooms
  has_many :guests, through: :hotel_rooms
end