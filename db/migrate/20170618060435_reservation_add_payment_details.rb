class ReservationAddPaymentDetails < ActiveRecord::Migration[5.0]

  def change
    create_table :payment_types do |t|
      t.string :label, null: false, limit: 20
      t.timestamps null: false
    end

    add_column :reservations, :payment_amount, :decimal, precision: 12, scale: 2, after: :paid_date
    add_reference :reservations, :payment_types, after: :paid_date
  end
end
