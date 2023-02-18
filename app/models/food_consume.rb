class FoodConsume < ApplicationRecord
  belongs_to :food
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :consume_quantity
    validates :consume_date
  end
end
