class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
    @rooms = @guest.rooms
  end

  def update
    @guest = Guest.find(params[:id])
    @room = Room.find(params[:search])
    GuestRoom.create!(guest: @guest, room: @room)
    redirect_to "/guests/#{@guest.id}"
  end
end