class Guest < ApplicationRecord
  has_many :guest_rooms
  has_many :rooms, through: :guest_rooms

  def self.count_guests
    count(:id)
  end
end
