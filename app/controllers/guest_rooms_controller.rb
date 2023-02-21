class GuestRoomsController < ActionController::Base
  def create
    GuestRoom.add_room(params)
    redirect_to "guests/#{params["guest_id"]}"
  end
end