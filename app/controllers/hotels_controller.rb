class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @rooms = @hotel.rooms
    # @guests = @hotel.rooms.guests
  end
end