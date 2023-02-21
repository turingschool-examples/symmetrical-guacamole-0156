class Room < ApplicationRecord
   belongs_to :hotel

   has_many :room_guests
   has_many :guests, through: :room_guests

   validates_presence_of :suite, :rate
   validates_numericality_of :rate
end