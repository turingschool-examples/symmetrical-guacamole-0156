class RoomController < ApplicationController

  def create
    
   guest_room = GuestRoom.new(guest_id: params[:id], room_id: params[:room_id])
   guest_room.save
   redirect_to "/guests/#{params[:id]}"
  end
end