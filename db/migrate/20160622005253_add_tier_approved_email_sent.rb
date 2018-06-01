class AddTierApprovedEmailSent < ActiveRecord::Migration
  def change
      add_column :users, :tier_approved_email, :datetime
  end
end
