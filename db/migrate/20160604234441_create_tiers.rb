class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.string :label, null: false, limit: 20
      t.string :description, null: false, limit: 255
      t.datetime :available, null:false

      t.timestamps null: false
    end

    add_column :users, :tier_id, :integer, null: true, after: :role
  end
end
