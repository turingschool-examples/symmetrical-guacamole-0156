class GuestRoomsController < ApplicationController
  def create
    guest = Guest.find(params[:id])
    room = Room.find(params[:room_id])
    gr = GuestRoom.create(guest_id: guest, room_id: room)
    # require 'pry'; binding.pry
    gr.save
    redirect_to "/guests/#{guest.id}"
  end
end