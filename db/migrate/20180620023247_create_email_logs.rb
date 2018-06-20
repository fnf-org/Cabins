class CreateEmailLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :email_logs do |t|
      t.string :email_type
      t.references :user, foreign_key: true
      t.references :tier, foreign_key: true

      t.timestamps
    end
  end
end
