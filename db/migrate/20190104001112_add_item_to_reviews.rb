class AddItemToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference(:reviews, :item, foreign_key: {to_table: :items})
  end
end
