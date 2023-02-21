class Hotel < ApplicationRecord
   has_many :rooms

  def list_of_guests
    Guest.joins(:room_guests).distinct.pluck(:name)
  end
end