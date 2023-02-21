class Hotel < ApplicationRecord
   has_many :rooms
   has_many :guests, through: :rooms
end