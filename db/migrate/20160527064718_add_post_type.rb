class AddPostType < ActiveRecord::Migration
  def change
    add_column :posts, :category, :string, limit: 40, null: true, after: :id
  end
end
