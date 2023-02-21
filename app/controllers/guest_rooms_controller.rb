class GuestRoomsController < ApplicationController
  def create
    GuestRoom.create!(guest: Guest.find(params[:id]), room: Room.find(params[:room_id]))
    redirect_to "/guests/#{params[:id]}"
  end
end