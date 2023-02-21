class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
    require 'pry'; binding.pry
  end
end