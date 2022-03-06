class ExtendVarcharLengths < ActiveRecord::Migration[5.0]
  def change
    change_column :buildings, :label, :string, null: false, limit: 40
    change_column :accommodations, :label, :string, null: false, limit: 40
    change_column :tiers, :label, :string, null: false, limit: 40
  end
end
