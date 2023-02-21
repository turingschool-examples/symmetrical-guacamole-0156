class RoomGuestsController < ApplicationController
	def create
		RoomGuest.create!(room_id: params[:room_id], guest_id: params[:guest_id])

		redirect_to "/guests/#{params[:guest_id]}"
	end
end