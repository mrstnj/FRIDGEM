class ChangeDataNameToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    change_column :food_consumes, :name, :integer
  end
end
