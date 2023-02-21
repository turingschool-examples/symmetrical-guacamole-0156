class CreateGuestRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_rooms do |t|
      t.belongs_to :guest
      t.belongs_to :room
      t.timestamps
    end
  end
end
