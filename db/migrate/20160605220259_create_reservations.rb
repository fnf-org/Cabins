class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :accommodation, null: false
      t.references :processed_by_user, null: false
      t.references :user, null: false
      t.datetime :paid_date, null: false
      t.decimal :price, precision: 12, scale: 2, null: false
      t.integer :quantity, null: false

      t.timestamps null: false
    end
  end
end
