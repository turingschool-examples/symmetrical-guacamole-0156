class Guest < ApplicationRecord
  has_many :room_guests
  has_many :rooms, through: :room_guests
end