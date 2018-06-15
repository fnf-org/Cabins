class AddDisplayOrderToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :display_order, :integer, default: 50
  end
end
