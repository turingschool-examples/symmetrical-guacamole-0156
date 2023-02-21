class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :nights
      
      t.timestamps
    end
  end
end
