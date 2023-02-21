class RoomGuestsController < ApplicationController
  def create
    RoomGuest.create!(room_guest_params)
    
    redirect_to "/guests/#{params[:guest_id]}"
  end

  private
  def room_guest_params
    params.permit(:guest_id, :room_id)
  end
end