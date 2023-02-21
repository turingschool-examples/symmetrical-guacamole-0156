class RoomGuestsController < ApplicationController

  def create
    room_guest = RoomGuest.new(room_id: params[:room_id], guest_id: params[:id])
    
    room_guest.save
    redirect_to "/guests/#{params[:id]}"
  end
end