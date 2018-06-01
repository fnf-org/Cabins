class AddConfirmationTimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :confirmed_time, :datetime
  end
end
