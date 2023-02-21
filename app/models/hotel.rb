class Hotel < ApplicationRecord
   has_many :rooms

  #  def get_unique_guests
  #   joins(:rooms).joins(:guests).distinct
  #  end
end