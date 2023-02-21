class HotelsController < ApplicationController

  def show
    @hotel = Hotel.find(params[:id])
    require 'pry'; binding.pry
  end
end