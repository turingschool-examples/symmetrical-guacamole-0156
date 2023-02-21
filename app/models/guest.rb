class Guest < ApplicationRecord
  # has_many :hotels
  # has_many :rooms, through: :hotel_rooms
  has_many :rooms
end
