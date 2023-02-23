class ChangeDataNameToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    change_column :food_consumes, :name, 'integer USING CAST(name AS integer)'
  end
end
