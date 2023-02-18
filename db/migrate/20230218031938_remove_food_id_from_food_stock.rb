class RemoveFoodIdFromFoodStock < ActiveRecord::Migration[7.0]
  def change
    remove_reference :food_stocks, :food, null: false, foreign_key: true
  end
end
