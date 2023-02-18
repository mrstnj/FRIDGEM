class ChangeConsumeFoodsToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    rename_table :consume_foods, :food_consumes
  end
end
