class GuestRoomsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    guest_room = GuestRoom.create!(guest_id: params[:id], room: room)
    redirect_to "/guests/#{params[:id]}"
  end
end