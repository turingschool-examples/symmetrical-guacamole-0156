class Guest < ApplicationRecord
  has_many :guest_rooms
  has_many :rooms, through: :guest_rooms

  def self.total_count
    distinct.count(:id)
  end

end