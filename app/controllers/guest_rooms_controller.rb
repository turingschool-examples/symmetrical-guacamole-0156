class GuestRoomsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    gr = GuestRoom.new(room: room, guest_id: params[:id])

    if gr.save
      flash[:success] = "Room created!"
      redirect_to "/guests/#{params[:id]}"
    else
      flash[:error] = "Room creation failed: #{gr.errors.full_messages.join}"
    end
  end
end