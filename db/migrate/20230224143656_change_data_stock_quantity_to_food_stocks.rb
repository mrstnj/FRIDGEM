class ChangeDataStockQuantityToFoodStocks < ActiveRecord::Migration[7.0]
  def change
    change_column :food_stocks, :stock_quantity, 'float USING CAST(stock_quantity AS float)'
  end
end
