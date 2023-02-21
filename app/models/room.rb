class Room < ApplicationRecord
   belongs_to :hotel
   has_many :guest_rooms 
   has_many :guests, through: :guest_rooms 

   validates_presence_of :rate, presence: true
   validates_presence_of :suite, presence: true
end