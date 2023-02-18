class AddFoodIdToConsumeFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :consume_foods, :food, null: false, foreign_key: true
  end
end
