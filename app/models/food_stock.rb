class FoodStock < ApplicationRecord
  belongs_to :food
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :stock_quantity
    validates :order_date
  end
end
