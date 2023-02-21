class HotelsController < ApplicationController
  def show
    @hotel = Hotel.find(params[:id])
    @guests = @hotel.guest_names
  end
end