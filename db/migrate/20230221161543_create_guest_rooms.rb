class CreateGuestRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_rooms do |t|
      t.references :rooms, foreign_key: true
      t.references :guests, foreign_key: true

      t.timestamps
    end
  end
end
