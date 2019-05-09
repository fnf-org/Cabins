class DropReservationConfirmation < ActiveRecord::Migration[5.0]
  def change
    change_table :reservations do |t|
      t.remove :confirmed_time
    end
  end
end
