class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def update
    GuestRoom.create(guest_id: params[:id], room_id: params[:room_id])
    redirect_to "/guests/#{params[:id]}"
  end
  
end