class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.references :accommodation_type, null: false
      t.references :building, null: false
      t.boolean :air_conditioning, null: false
      t.boolean :bathroom, null: false
      t.string :description, null: true, limit: 255
      t.boolean :hold, null: false
      t.boolean :kitchen, null: false
      t.string :label, null: false, limit: 20
      t.integer :occupancy, null: false
      t.decimal :price, precision: 12, scale: 2, null: false
      t.integer :quantity, null: false
      t.timestamps null: false
    end
  end
end
