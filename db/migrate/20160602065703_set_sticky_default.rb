class SetStickyDefault < ActiveRecord::Migration
  def change
    change_column :posts, :sticky, :boolean, null: false, default: false, after: :body
  end
end
