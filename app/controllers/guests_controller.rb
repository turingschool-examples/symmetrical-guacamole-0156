class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
    @guest_rooms = @guest.rooms
  end
end