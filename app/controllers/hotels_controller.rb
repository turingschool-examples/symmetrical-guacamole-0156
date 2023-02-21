class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @hotel_guests = @hotel.list_of_guests
  end
end