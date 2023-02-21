class RoomsController < ApplicationController
	def index
		@hotels = Hotel.all
	end
end