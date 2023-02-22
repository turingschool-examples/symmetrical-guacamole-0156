class GuestRoomsController < ApplicationController
  def create
    gr = GuestRoom.new(room_id: params[:room_id], guest_id: params[:id])
    # why new instead of create?
    gr.save
    redirect_to "/guests/#{params[:id]}"
  end
end