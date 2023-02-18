class FoodConsume < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :name
    validates :price
    validates :consume_quantity
    validates :consume_date
  end
end
