class AddStartTimeToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    add_column :food_consumes, :start_time, :datetime
  end
end
