class ReservationUpdates < ActiveRecord::Migration
  def change
    change_column :reservations, :processed_by_user_id, :integer, null: true, after: :accommodation_id
    change_column :reservations, :paid_date, :datetime, null: true, after: :user_id
  end
end
