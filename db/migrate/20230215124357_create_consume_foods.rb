class CreateConsumeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :consume_foods do |t|
      t.string :name
      t.integer :price
      t.integer :consume_quantity
      t.string :note
      t.date :consume_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :consume_foods, [:user_id, :created_at]
  end
end
