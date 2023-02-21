class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @unique_guests = @hotel.unique_guests
  end
end