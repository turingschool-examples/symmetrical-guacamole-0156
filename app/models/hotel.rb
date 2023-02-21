class Hotel < ApplicationRecord
   has_many :rooms

   def self.guest_names
      joins(:rooms, :guests).where().pluck(:name)
   end
end