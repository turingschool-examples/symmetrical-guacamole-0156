class Hotel < ApplicationRecord
   has_many :rooms
   
   validates_presence_of :name, presence: true
   validates_presence_of :location, presence: true
end