class CreateFoodStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stocks do |t|
      t.integer :stock_quantity
      t.date :order_date
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
     add_index :food_stocks, [:created_at]
  end
end
