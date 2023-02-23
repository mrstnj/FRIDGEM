class RenameNameColumnToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    rename_column :food_consumes, :name, :food_stock_id
  end
end
