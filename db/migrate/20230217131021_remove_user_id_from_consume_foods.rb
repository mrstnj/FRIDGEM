class RemoveUserIdFromConsumeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_reference :consume_foods, :user, null: false, foreign_key: true
  end
end
