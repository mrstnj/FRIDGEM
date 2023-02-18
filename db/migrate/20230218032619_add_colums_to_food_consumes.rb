class AddColumsToFoodConsumes < ActiveRecord::Migration[7.0]
  def change
    add_column :food_consumes, :name, :string, after: :id
    add_column :food_consumes, :price, :integer, after: :name
  end
end
