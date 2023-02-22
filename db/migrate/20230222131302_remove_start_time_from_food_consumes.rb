class RemoveStartTimeFromFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :food_consumes, :consume_date, :date
  end
end
