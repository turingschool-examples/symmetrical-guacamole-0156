class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :nights
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
