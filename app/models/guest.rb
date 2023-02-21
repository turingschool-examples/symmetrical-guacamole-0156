class Guest < ApplicationRecord 
  has_many :guest_rooms 
  has_many :rooms, through: :guest_rooms
  validates_presence_of :name
  validates_numericality_of :nights
end