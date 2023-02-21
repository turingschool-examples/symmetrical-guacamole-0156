class GuestRoomsController < ApplicationController
  def create
    guestroom = GuestRoom.new(room_id: params[:room_id], guest_id: params[:id])
    guestroom.save
    redirect_to "/guests/#{params[:id]}"
  end
end