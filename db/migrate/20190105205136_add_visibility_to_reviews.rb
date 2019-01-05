class AddVisibilityToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :visibility, :boolean, default: true
  end
end
