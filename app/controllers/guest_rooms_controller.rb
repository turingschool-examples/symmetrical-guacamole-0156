class GuestRoomsController < ApplicationController

  def create
    guest_room = GuestRoom.new(guest_room_params)

    if guest_room.save 
      redirect_to "/guests/#{guest_room.guest_id}"
    end
  end

  private 

  def guest_room_params
    params.permit(:guest_id, :room_id)
  end
end 


# def create 
#   application = Application.new(application_params)

#   if application.save
#     redirect_to "/applications/#{application.id}" 
#   else
#     redirect_to "/applications/new"
#     @errors = application.errors.messages
#     flash[:alert] = @errors.map do |error|
#       "#{error.first.capitalize} #{error.last}.".gsub(/[\["\]]/, "")
#     end.join.gsub(/\./, ". ")
#   end 
# end

