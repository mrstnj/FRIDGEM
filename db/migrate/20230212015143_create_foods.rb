class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.date :order_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :foods, [:user_id, :created_at]
  end
end
