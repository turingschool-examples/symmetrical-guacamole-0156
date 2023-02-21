class RoomGuestsController < ApplicationController

  def create
    RoomGuest.new(room_id: params[:room_id], guest_id: params[:id])
    redirect_to "/guests/#{params[:id]}"
  end
end