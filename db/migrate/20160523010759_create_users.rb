class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 60, null: false
      t.string :email, limit: 255, null: false
      t.boolean :admin, null: false, default: false
      t.string :password_digest
      t.timestamps null: false
      t.index :email, unique:true
    end
  end
end
