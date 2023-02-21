class GuestRoomsController < ApplicationController 
  def create 
    new_guest_room = GuestRoom.create!(guest_room_params)

    redirect_to "/guests/#{params[:guest_id]}"
  end

  private 

  def guest_room_params 
    params.permit(:guest_id, :room_id)
  end
end