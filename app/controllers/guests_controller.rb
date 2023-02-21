class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
    @rooms = @guest.rooms
  end

  def create
    room_guest = RoomGuest.create!(room_id: params[:room_id], guest_id: params[:id] )
    redirect_to "/guests/#{params[:id]}"
  end
end