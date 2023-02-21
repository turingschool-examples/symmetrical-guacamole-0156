class GuestsController < ApplicationRecord
  def show
    @guest = Guest.find(params[:id])
  end

  def update
    room = Room.find(strong_params[:room_id])
    room.update(guest_id: params[:id])

    redirect_to "/guest/#{guest.id}"
  end

  private
  def strong_params
    params.require(:guest).permit(:room_id)
  end
end