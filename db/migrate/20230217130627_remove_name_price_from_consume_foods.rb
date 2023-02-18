class RemoveNamePriceFromConsumeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :consume_foods, :name, :string
    remove_column :consume_foods, :price, :integer
  end
end
