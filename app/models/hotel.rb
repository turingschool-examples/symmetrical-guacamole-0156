class Hotel < ApplicationRecord
  has_many :rooms

  validates_presence_of :name, :location

  def unique_guests
    Hotel.joins(rooms: :guests).where(id: self.id).distinct.pluck("guests.name")
  end
end