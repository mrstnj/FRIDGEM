class ChangeDataSubtotalToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    change_column :food_consumes, :subtotal, 'float USING CAST(subtotal AS float)'
  end
end
