class AddRegistrationFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :notes, :text, null: true, after: :admin
    add_column :users, :phone, :string, null: false, limit: 16, after: :password_digest
    add_column :users, :role, :string, null: false, limit: 20, after: :phone
  end
end
