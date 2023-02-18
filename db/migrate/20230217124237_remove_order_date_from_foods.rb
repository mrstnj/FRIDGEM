class RemoveOrderDateFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :order_date, :date
  end
end
