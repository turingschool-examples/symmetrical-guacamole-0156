class HotelsController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
    binding.pry
  end
end