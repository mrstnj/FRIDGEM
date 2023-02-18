class FoodStock < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :name
    validates :price
    validates :stock_quantity
    validates :order_date
  end
end
