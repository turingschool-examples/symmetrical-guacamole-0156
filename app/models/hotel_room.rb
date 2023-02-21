class HotelRoom < ApplicationRecord
  belongs_to :hotel
  belongs_to :room
end
