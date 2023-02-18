class ChangeColumnConsumeFoods < ActiveRecord::Migration[7.0]
  def up
    change_column :consume_foods, :food_id, :integer, after: :id
  end
end
