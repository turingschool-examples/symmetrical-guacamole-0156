class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @unique_guests = @hotel.guests.uniq_guests
  end
end