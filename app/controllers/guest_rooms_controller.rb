class GuestRoomsController < ApplicationController

  def create 
    guest_room = GuestRoom.new(guest_id: params[:id], room_id: params[:room_id])

    redirect_to "/guests/#{guest_room.guest_id}"

    if guest_room.save
      flash[:info] = "Room Successfully Added!"
    else  
      flash[:error] = "Error: #{error_message(guest_room.errors)}"
    end
  end
end