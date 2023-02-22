class FoodConsume < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :name
    validates :price
    validates :consume_quantity
    validates :start_time
  end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :consume_quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
