class AddPostType < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :category, :string, limit: 40, null: true, after: :id
  end
end
