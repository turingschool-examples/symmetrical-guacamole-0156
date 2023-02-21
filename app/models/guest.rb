class Guest < ApplicationRecord
  has_many :guest_rooms 
  has_many :rooms, through: :guest_rooms

  def self.unique_list_of_guests(id)
    joins(rooms: :hotel).where(hotels: {id: id}).distinct
  end
end