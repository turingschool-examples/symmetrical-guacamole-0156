class HotelsController < ApplicationController

  def show
    @hotel = Hotel.find(params[:id])

    @unique_list_of_guests = Guest.unique_list_of_guests(params[:id].to_i)
  end
end 