class AddReferencesToFoodStocks < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_stocks, :user, null: false, foreign_key: true
  end
end
