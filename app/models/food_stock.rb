class FoodStock < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  with_options presence: true do
    validates :name
    validates :price
    validates :stock_quantity
    validates :order_date
  end
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :stock_quantity, numericality: {greater_than_or_equal_to: 0}

  # 食材と購入日を結合する
  def view_name_and_date
    self.name + '(' "購入日："+ self.order_date.to_s + ')'
  end
end
