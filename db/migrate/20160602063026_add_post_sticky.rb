class AddPostSticky < ActiveRecord::Migration
  def change
    add_column :posts, :sticky, :boolean, null: true, after: :body
  end
end
