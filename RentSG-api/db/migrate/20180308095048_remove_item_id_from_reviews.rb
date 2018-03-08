class RemoveItemIdFromReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :item_id, :integer
  end
end
