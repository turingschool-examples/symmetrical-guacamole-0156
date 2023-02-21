class Hotel < ApplicationRecord
  has_many :rooms
  has_many :guests, through: :rooms

  def list_unique_guests
    self.guests.distinct
  end
end