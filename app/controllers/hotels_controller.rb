class HotelsController < ApplicationController 
  def show 
    @hotel = Hotel.find(params[:hotel_id])
  end
end