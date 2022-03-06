class AddEmailSupportToTiers < ActiveRecord::Migration[5.0][5.0]
  def change
    add_column :tiers, :sent_date, :datetime
    add_column :tiers, :email_html, :string
    add_column :tiers, :email_text, :string
    add_column :tiers, :subject, :string
  end
end
