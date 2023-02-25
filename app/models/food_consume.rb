class FoodConsume < ApplicationRecord
  belongs_to :user
  default_scope -> { order(start_time: :desc) }
  with_options presence: true do
    validates :food_stock_id
    validates :consume_quantity
    validates :start_time
  end
  validates :consume_quantity, numericality: {greater_than_or_equal_to: 0}

  # 食材ごとの食費を計算する
  before_save do
    food_stock = FoodStock.find(food_stock_id)
    self.subtotal = food_stock.price * consume_quantity
  end
end
