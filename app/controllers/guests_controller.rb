class GuestsController < ApplicationController
  def show
    @guest = Guest.find(params[:id])
    @rooms = @guest.rooms
    # require 'pry'; binding.pry
    # @hotels
  end
end