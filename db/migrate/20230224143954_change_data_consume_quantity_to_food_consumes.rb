class ChangeDataConsumeQuantityToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    change_column :food_consumes, :consume_quantity, 'float USING CAST(consume_quantity AS float)'
  end
end
