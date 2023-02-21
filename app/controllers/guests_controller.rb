class GuestsController < ApplicationController
	def show
		@guest = Guest.find(params[:id])
		@rooms = @guest.rooms
		@all_rooms = Room.all
	end
end