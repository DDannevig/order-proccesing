class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :identifier, null: false

      t.index :identifier, unique: true
      t.timestamps
    end
  end
end
