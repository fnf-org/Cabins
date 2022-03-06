class AddTierApprovedEmailSent < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :tier_approved_email, :datetime
  end
end
