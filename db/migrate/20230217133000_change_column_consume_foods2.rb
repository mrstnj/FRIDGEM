class ChangeColumnConsumeFoods2 < ActiveRecord::Migration[7.0]
  def up
    change_column :consume_foods, :food_id, :integer, after: :id
    change_column :consume_foods, :note, :string, after: :consume_date
  end
end
