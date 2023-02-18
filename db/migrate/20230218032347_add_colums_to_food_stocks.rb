class AddColumsToFoodStocks < ActiveRecord::Migration[7.0]
  def change
    add_column :food_stocks, :name, :string, after: :id
    add_column :food_stocks, :price, :integer, after: :name
  end
end
