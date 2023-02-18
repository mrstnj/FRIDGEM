class AddFoodIdToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_consumes, :food, null: false, foreign_key: true, after: :consume_date
  end
end
