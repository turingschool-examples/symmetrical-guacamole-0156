class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = Guest.find(params[:id])
    @room = Room.find(params[:room_id])
  end
end