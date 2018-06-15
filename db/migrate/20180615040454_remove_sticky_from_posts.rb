class RemoveStickyFromPosts < ActiveRecord::Migration[5.0]
  def change
      remove_column :posts, :sticky, :boolean
  end
end
