class RemovePriceFromFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    remove_column :food_consumes, :price, :integer
  end
end
