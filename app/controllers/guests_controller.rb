class GuestsController < ActionController::Base
  def show
    @guest = Guest.find(params[:id])
  end
end