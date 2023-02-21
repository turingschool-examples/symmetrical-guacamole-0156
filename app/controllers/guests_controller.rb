class GuestsController < ApplicationController 
  def show 
    @guest = Guest.find(params[:guest_id])
  end
end