class ExtendEmailBodyFields < ActiveRecord::Migration[5.0]
  def change
    change_column :tiers, :email_text, :text
    change_column :tiers, :email_html, :text
  end
end
