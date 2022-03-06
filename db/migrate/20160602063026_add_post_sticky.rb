class AddPostSticky < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :sticky, :boolean, null: true, after: :body
  end
end
