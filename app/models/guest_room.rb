class GuestRoom < ApplicationRecord
  belongs_to :room
  belongs_to :guest

  def self.add_room(params)
    GuestRoom.create(room_id: params["room_id"], guest_id: params["guest_id"])
  end
end