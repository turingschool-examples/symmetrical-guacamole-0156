class GuestRoom < ApplicationRecord
  belongs_to :guest
  belongs_to :room
  after_create :reservation_count

  def reservation_count
    self.room.reservations = self.room.reservations.to_i + 1
    self.save
  end
end
