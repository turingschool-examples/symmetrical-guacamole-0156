class GuestRoomsController < ApplicationController
  def create
    gc = GuestRoom.new(room_id: params[:room_id], guest_id: params[:id]) 

    if !gc.save
    flash[:alert] = gc.errors.full_messages
    end
    redirect_to "/guests/#{params[:id]}"
  end
end