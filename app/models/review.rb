class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }

end
