class AddConfirmationTimeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :confirmed_time, :datetime
  end
end
