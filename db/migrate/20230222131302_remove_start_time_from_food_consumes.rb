class RemoveStartTimeFromFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :food_consumes, :start_time, :date
  end
end
