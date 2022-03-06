class CreateBuildingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :building_types do |t|
      t.string :description, null: true, limit: 255
      t.string :label, null: false, limit: 20
      t.timestamps null: false
    end
  end
end
