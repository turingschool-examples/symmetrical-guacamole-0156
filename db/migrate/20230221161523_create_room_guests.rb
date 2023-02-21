class CreateRoomGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :room_guests do |t|
      t.belongs_to :room, foreign_key: true
      t.belongs_to :guest, foreign_key: true

      t.timestamps
    end
  end
end
