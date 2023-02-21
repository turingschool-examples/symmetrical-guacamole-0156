class Hotel < ApplicationRecord
   has_many :rooms

   validates_presence_of :name, :location
end