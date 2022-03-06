class CreateInstants < ActiveRecord::Migration[5.0][5.0]
  def change
    create_table :instants do |t|
      t.string :name
      t.string :description
      t.datetime :instant

      t.index :name, unique:true
      t.timestamps
    end
  end
end
