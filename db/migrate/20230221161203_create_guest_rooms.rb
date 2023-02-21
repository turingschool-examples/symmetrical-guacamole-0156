class CreateGuestRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_rooms do |t|
      t.references :room, foreign_key: true
      t.references :guest, foreign_key: true
    end
  end
end
