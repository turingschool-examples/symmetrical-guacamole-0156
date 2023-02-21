class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    # @guest_count = @rooms.guest_count
  end

  def create
    # require 'pry'; binding.pry
    guest_room = GuestRoom.create!(guest_id: params[:id], room_id: params[:room_id], )

    if !guest_room.save
      flash[:alert] = et.errors.full_messages
    end

    redirect_to "/guests/#{params[:id]}"
  end
end