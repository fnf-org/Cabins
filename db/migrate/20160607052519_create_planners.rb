class CreatePlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :planners do |t|
      t.string :email, null: false
      t.timestamps null: false
    end

    add_column :users, :planner_found, :boolean, null: false, default: false, after: :phone
  end
end
