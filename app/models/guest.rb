class Guest < ApplicationRecord
  has_many :guest_rooms, dependent: :destroy
  has_many :rooms, through: :guest_rooms
end
