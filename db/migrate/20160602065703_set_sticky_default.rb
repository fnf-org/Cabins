class SetStickyDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :sticky, :boolean, null: false, default: false, after: :body
  end
end
