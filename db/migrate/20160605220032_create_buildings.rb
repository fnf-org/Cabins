class CreateBuildings < ActiveRecord::Migration[5.0]
  def change
    create_table :buildings do |t|
      t.references :building_type, null: false
      t.string :description, null: true, limit: 255
      t.string :image, null: true, limit: 255
      t.string :label, null: false, limit: 20
      t.timestamps null: false
    end
  end
end
