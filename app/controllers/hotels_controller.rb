class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @guests = @hotel.guests.distinct
  end
end