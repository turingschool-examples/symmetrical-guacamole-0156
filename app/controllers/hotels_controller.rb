class HotelsController < ApplicationController
	def show
		@hotel = Hotel.find(params[:id])
		@unique = @hotel.unique_guests
	end
end