class GuestRoomsController < ApplicationController
  def create
    # gr = GuestRoom.create(guest_id: guest, room_id: room)
    gr = GuestRoom.new(room_id: params[:room_id], guest_id: params[:id])
    # require 'pry'; binding.pry
    # why new instead of create
    gr.save
    redirect_to "/guests/#{params[:id]}"

  end
end