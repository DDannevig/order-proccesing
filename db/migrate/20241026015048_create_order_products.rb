class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :quantity, null: false

      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false

      t.timestamps
    end
  end
end
