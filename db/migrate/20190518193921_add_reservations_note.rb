class AddReservationsNote < ActiveRecord::Migration[5.0][5.0]
  def change
    add_column :reservations, :note, :text
  end
end
