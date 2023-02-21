class RoomGuestsController < ApplicationController
  def create
    RoomGuest.create!(room_id: params[:room_id], guest_id: params[:id])
    redirect_to "/guests/#{params[:id]}"
  end
end