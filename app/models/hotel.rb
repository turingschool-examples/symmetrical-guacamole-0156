class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guest_rooms, through: :rooms
  has_many :guests, through: :guest_rooms


end