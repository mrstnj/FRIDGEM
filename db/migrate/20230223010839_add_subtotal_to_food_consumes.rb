class AddSubtotalToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    add_column :food_consumes, :subtotal, :integer
  end
end
