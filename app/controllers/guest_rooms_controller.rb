class GuestRoomsController < ApplicationController

  # def create
  #   GuestRoom.create!(room_id: params[:room_id], guest_id: params[:id])
  #   redirect_to "/guests/#{params[:id]}"
  # end

  def create
    gr = GuestRoom.new(room_id: params[:room_id], guest_id: params[:id])
      if !gr.save
        flash[:alert] = gr.errors.full_messages.join(', ')
      end
    redirect_to "/guests/#{params[:id]}"
  end
end