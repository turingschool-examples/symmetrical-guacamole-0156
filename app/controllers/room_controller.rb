class RoomsController < ApplicationRecord
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end
end