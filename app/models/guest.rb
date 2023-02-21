class Guest < ApplicationRecord
  has_many :room_guests
  has_many :rooms, through: :room_guests

  validates_presence_of :name, :nights
  validates_numericality_of :nights

  def self.total_guests
    self.distinct.count
  end
end
